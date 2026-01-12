# Home Assistant Add-ons by juherr

[![Home Assistant Add-ons CI](https://github.com/juherr/ha-addons/actions/workflows/addons.yml/badge.svg)](https://github.com/juherr/ha-addons/actions/workflows/addons.yml)

This repository contains **custom Home Assistant add-ons** maintained by **Julien Herr**.

The objective is to provide **production-grade, opinionated add-ons** for **Home Assistant OS**, with a strong focus on:
- robustness
- security
- explicit configuration
- long-term maintainability
- low resource usage (Raspberry Pi friendly)

---

## Available Add-ons

### 🛡️ Otoroshi

**Otoroshi** is a reverse proxy and API gateway written in Java.

This add-on allows you to run Otoroshi **natively on Home Assistant OS** as a supervised add-on, fully integrated with the Home Assistant Supervisor lifecycle.

**Key features**
- ARM support (Raspberry Pi)
- Bounded JVM memory
- Persistent storage via `/data`
- Clean startup / shutdown handling
- Optional plugin support

**Typical use cases**
- Securely expose Home Assistant to the outside world
- Reverse-proxy other Home Assistant add-ons
- Centralize TLS termination, authentication, and routing
- Act as a lightweight API gateway for a home lab

---

## Installation

1. Open **Home Assistant**
2. Go to **Settings → Add-ons → Add-on Store**
3. Open the menu (⋮) and click **Repositories**
4. Add the following repository URL: https://github.com/juherr/ha-addons
5. Close the dialog and click **Check for updates**
6. The add-ons from this repository will appear under **Local add-ons**
7. Install the desired add-on and configure it before starting

---

## Supported Architectures

- `aarch64`
- `armv7`

This repository currently targets **Home Assistant OS on Raspberry Pi**.

---

## Design Principles & Constraints

These add-ons are designed specifically for **Home Assistant OS**, which implies a number of constraints:

- No system services (no systemd)
- No system package manager (no apt, no apk at runtime)
- Everything runs inside a supervised Docker container
- All persistent data must be stored under `/data`
- Logs are written to stdout only
- Memory and CPU usage are explicitly constrained

The goal is to remain **stable, predictable, and safe** on small devices.

---

## CI & Quality

This repository uses **GitHub Actions** with the official **Home Assistant add-on linter**:

- Validates repository structure
- Validates add-on metadata (`config.yaml`)
- Enforces Home Assistant add-on best practices

Any structural or metadata issue will fail the CI.

---

## Disclaimer

These add-ons are provided **as-is**, without any warranty.

They are intended for **advanced users** who understand:
- Home Assistant OS internals
- Docker-based add-ons
- Networking and security implications when exposing services

⚠️ **Do not expose Home Assistant or addons to the internet without proper authentication and TLS configuration.**

---

## License

Each add-on may define its own license.  
Please refer to the individual add-on directories for details.

---

## Maintainer

Julien Herr  
GitHub: https://github.com/juherr
