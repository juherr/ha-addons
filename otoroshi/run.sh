#!/bin/sh
set -eu

OPTIONS_FILE="/data/options.json"

get_opt() {
  key="$1"
  if [ -f "$OPTIONS_FILE" ]; then
    sed -n "s/.*\"$key\"[[:space:]]*:[[:space:]]*\"\\([^\"]*\\)\".*/\\1/p" "$OPTIONS_FILE" | head -n 1
  fi
}

JAVA_OPTS="$(get_opt java_opts)"
STORAGE="$(get_opt storage)"
FILEDB_PATH="$(get_opt filedb_path)"
ADMIN_PASSWORD="$(get_opt admin_password)"

JAVA_OPTS="${JAVA_OPTS:-"-Xms256m -Xmx512m"}"
STORAGE="${STORAGE:-file}"
FILEDB_PATH="${FILEDB_PATH:-/data/filedb/state.ndjson}"

mkdir -p "$(dirname "$FILEDB_PATH")"

JAVA_OPTS="$JAVA_OPTS -XX:+IgnoreUnrecognizedVMOptions --illegal-access=warn"

COMMON_FLAGS="
--add-opens java.base/javax.net.ssl=ALL-UNNAMED
--add-opens java.base/jdk.internal.misc=ALL-UNNAMED
--add-opens java.base/sun.net.www.protocol.file=ALL-UNNAMED
--add-exports=java.base/sun.security.x509=ALL-UNNAMED
--add-opens java.base/sun.security.ssl=ALL-UNNAMED
-Dlog4j2.formatMsgNoLookups=true
-Dhttp.port=8080
-Dhttps.port=8443
-Dotoroshi.storage=$STORAGE
-Dotoroshi.filedb.path=$FILEDB_PATH
-Dotoroshi.adminPassword=$ADMIN_PASSWORD
"

PLUGINS_DIR="/data/plugins"

echo "Starting Otoroshi with JAVA_OPTS=$JAVA_OPTS"

if [ -d "$PLUGINS_DIR" ] && [ "$(ls -A "$PLUGINS_DIR" 2>/dev/null || true)" ]; then
  exec java $JAVA_OPTS $COMMON_FLAGS \
    -cp "/usr/app/otoroshi.jar:$PLUGINS_DIR/*" \
    play.core.server.ProdServerStart
else
  exec java $JAVA_OPTS $COMMON_FLAGS \
    -jar /usr/app/otoroshi.jar
fi

