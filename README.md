# Etcher-Download

A simple install script for [balenaEtcher](https://etcher.balena.io/) on Linux (Arch/x64).

Downloads, installs, and sets up balenaEtcher system-wide without using a package manager.

## Install

```bash
git clone git@github.com:pjanarchist/Etcher-Download.git
cd Etcher-Download
chmod +x install-etcher.sh
./install-etcher.sh
```

## What it does

- Downloads balenaEtcher v2.1.6 from the official GitHub release
- Installs it to `/opt/balena-etcher`
- Creates a symlink at `/usr/local/bin/balena-etcher` so you can run it from anywhere
- Adds a desktop entry so it appears in your app launcher

## Usage

After install, run with:

```bash
balena-etcher
```

Or launch it from your app finder.
