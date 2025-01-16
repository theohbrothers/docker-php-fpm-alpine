# docker-php

[![github-actions](https://github.com/theohbrothers/docker-php/actions/workflows/ci-master-pr.yml/badge.svg?branch=master)](https://github.com/theohbrothers/docker-php/actions/workflows/ci-master-pr.yml)
[![github-release](https://img.shields.io/github/v/release/theohbrothers/docker-php?style=flat-square)](https://github.com/theohbrothers/docker-php/releases/)
[![docker-image-size](https://img.shields.io/docker/image-size/theohbrothers/docker-php/latest)](https://hub.docker.com/r/theohbrothers/docker-php)

Dockerized php with php extension(s), based on [official php images](https://hub.docker.com/_/php).

## Tags

| Tag | Dockerfile Build Context |
|:-------:|:---------:|
| `:8.4.3-fpm-alpine`, `:latest` | [View](variants/8.4.3-fpm-alpine) |
| `:8.4.3-fpm-alpine-opcache-mysqli-gd-pdo-memcached-sockets` | [View](variants/8.4.3-fpm-alpine-opcache-mysqli-gd-pdo-memcached-sockets) |
| `:8.4.3-fpm-alpine-opcache-mysqli-gd-pdo-memcached-sockets-xdebug` | [View](variants/8.4.3-fpm-alpine-opcache-mysqli-gd-pdo-memcached-sockets-xdebug) |
| `:8.3.15-fpm-alpine` | [View](variants/8.3.15-fpm-alpine) |
| `:8.3.15-fpm-alpine-opcache-mysqli-gd-pdo-memcached-sockets` | [View](variants/8.3.15-fpm-alpine-opcache-mysqli-gd-pdo-memcached-sockets) |
| `:8.3.15-fpm-alpine-opcache-mysqli-gd-pdo-memcached-sockets-xdebug` | [View](variants/8.3.15-fpm-alpine-opcache-mysqli-gd-pdo-memcached-sockets-xdebug) |
| `:8.2.27-fpm-alpine` | [View](variants/8.2.27-fpm-alpine) |
| `:8.2.27-fpm-alpine-opcache-mysqli-gd-pdo-memcached-sockets` | [View](variants/8.2.27-fpm-alpine-opcache-mysqli-gd-pdo-memcached-sockets) |
| `:8.2.27-fpm-alpine-opcache-mysqli-gd-pdo-memcached-sockets-xdebug` | [View](variants/8.2.27-fpm-alpine-opcache-mysqli-gd-pdo-memcached-sockets-xdebug) |
| `:8.1.31-fpm-alpine` | [View](variants/8.1.31-fpm-alpine) |
| `:8.1.31-fpm-alpine-opcache-mysqli-gd-pdo-memcached-sockets` | [View](variants/8.1.31-fpm-alpine-opcache-mysqli-gd-pdo-memcached-sockets) |
| `:8.1.31-fpm-alpine-opcache-mysqli-gd-pdo-memcached-sockets-xdebug` | [View](variants/8.1.31-fpm-alpine-opcache-mysqli-gd-pdo-memcached-sockets-xdebug) |
| `:8.0.30-fpm-alpine` | [View](variants/8.0.30-fpm-alpine) |
| `:8.0.30-fpm-alpine-opcache-mysqli-gd-pdo-memcached-sockets` | [View](variants/8.0.30-fpm-alpine-opcache-mysqli-gd-pdo-memcached-sockets) |
| `:8.0.30-fpm-alpine-opcache-mysqli-gd-pdo-memcached-sockets-xdebug` | [View](variants/8.0.30-fpm-alpine-opcache-mysqli-gd-pdo-memcached-sockets-xdebug) |
| `:7.4.33-fpm-alpine` | [View](variants/7.4.33-fpm-alpine) |
| `:7.4.33-fpm-alpine-opcache-mysqli-gd-pdo-memcached-sockets` | [View](variants/7.4.33-fpm-alpine-opcache-mysqli-gd-pdo-memcached-sockets) |
| `:7.4.33-fpm-alpine-opcache-mysqli-gd-pdo-memcached-sockets-xdebug` | [View](variants/7.4.33-fpm-alpine-opcache-mysqli-gd-pdo-memcached-sockets-xdebug) |
| `:7.3.33-fpm-alpine` | [View](variants/7.3.33-fpm-alpine) |
| `:7.3.33-fpm-alpine-opcache-mysqli-gd-pdo-memcached-sockets` | [View](variants/7.3.33-fpm-alpine-opcache-mysqli-gd-pdo-memcached-sockets) |
| `:7.3.33-fpm-alpine-opcache-mysqli-gd-pdo-memcached-sockets-xdebug` | [View](variants/7.3.33-fpm-alpine-opcache-mysqli-gd-pdo-memcached-sockets-xdebug) |
| `:7.2.34-fpm-alpine` | [View](variants/7.2.34-fpm-alpine) |
| `:7.2.34-fpm-alpine-opcache-mysqli-gd-pdo-memcached-sockets` | [View](variants/7.2.34-fpm-alpine-opcache-mysqli-gd-pdo-memcached-sockets) |
| `:7.2.34-fpm-alpine-opcache-mysqli-gd-pdo-memcached-sockets-xdebug` | [View](variants/7.2.34-fpm-alpine-opcache-mysqli-gd-pdo-memcached-sockets-xdebug) |

## Development

Requires Windows `powershell` or [`pwsh`](https://github.com/PowerShell/PowerShell).

```powershell
# Install Generate-DockerImageVariants module: https://github.com/theohbrothers/Generate-DockerImageVariants
Install-Module -Name Generate-DockerImageVariants -Repository PSGallery -Scope CurrentUser -Force -Verbose

# Edit ./generate templates

# Generate the variants
Generate-DockerImageVariants .
```

### Variant versions

[versions.json](generate/definitions/versions.json) contains a list of [Semver](https://semver.org/) versions, one per line.

To update versions in `versions.json`:

```powershell
./Update-Versions.ps1
```

To update versions in `versions.json`, and open a PR for each changed version, and merge successful PRs one after another (to prevent merge conflicts), and finally create a tagged release and close milestone:

```powershell
$env:GITHUB_TOKEN = 'xxx'
./Update-Versions.ps1 -PR -AutoMergeQueue -AutoRelease
```

To perform a dry run, use `-WhatIf`.
