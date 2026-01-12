# Repository Guidelines

## Project Structure & Module Organization
- `repository.yaml` defines the Home Assistant add-on repository metadata.
- `README.md` provides the user-facing overview, install steps, and constraints.
- `otoroshi/` contains the Otoroshi add-on sources:
  - `config.yaml` add-on metadata, options, and schema.
  - `build.yaml` base image selection per architecture.
  - `Dockerfile` container build instructions.
  - `run.sh` runtime entrypoint and option wiring.

## Build, Test, and Development Commands
- Local builds are typically handled by the Home Assistant add-on build system.
- Useful entrypoints when working on the add-on:
  - `bash otoroshi/run.sh` (inside the container) starts Otoroshi with resolved options.
  - Build uses the `Dockerfile` + `build.yaml` base image; no repository-level build script is defined.

## Coding Style & Naming Conventions
- YAML uses 2-space indentation (`config.yaml`, `build.yaml`, `repository.yaml`).
- Shell scripts use POSIX `sh` with `set -eu` and quoted variables (`run.sh`).
- Add-on options are lower_snake_case (e.g., `filedb_path`).

## Testing Guidelines
- No automated test suite is currently defined in this repository.
- Validate changes by building the add-on in Home Assistant and checking startup logs.

## Commit & Pull Request Guidelines
- Commit messages are short, sentence-style (e.g., “Initial Home Assistant add-on for Otoroshi”).
- PRs should include:
  - A clear description of the add-on change and affected files.
  - Configuration changes with example values (e.g., `admin_password`).
  - Any upgrade or migration notes for existing installations.

## Security & Configuration Tips
- All persistent data must be stored under `/data`.
- Do not log secrets; `admin_password` is stored in options and passed via JVM flags.
- Keep ports and defaults aligned with `config.yaml` (`8080`, `8443`).
