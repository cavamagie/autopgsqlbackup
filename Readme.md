 Installing AWX

This document provides a guide for installing AWX.

## Table of contents

- [Getting started](#getting-started)
  - [Clone the repo](#clone-the-repo)
  - [AWX branding](#awx-branding)
  - [Prerequisites](#prerequisites)
  - [System Requirements](#system-requirements)
  - [AWX Tunables](#awx-tunables)
  - [Choose a deployment platform](#choose-a-deployment-platform)
  - [Official vs Building Images](#official-vs-building-images)
- [OpenShift](#openshift)
  - [Prerequisites](#prerequisites-1)
    - [Deploying to Minishift](#deploying-to-minishift)
  - [Pre-build steps](#pre-build-steps)
  - [PostgreSQL](#postgresql)
  - [Start the build](#start-the-build)
  - [Post build](#post-build)
  - [Accessing AWX](#accessing-awx)
- [Kubernetes](#kubernetes)
  - [Prerequisites](#prerequisites-2)
  - [Pre-build steps](#pre-build-steps-1)
  - [Configuring Helm](#configuring-helm)
  - [Start the build](#start-the-build-1)
  - [Accessing AWX](#accessing-awx-1)
  - [SSL Termination](#ssl-termination)
- [Docker or Docker Compose](#docker-or-docker-compose)
  - [Prerequisites](#prerequisites-3)
  - [Pre-build steps](#pre-build-steps-2)
    - [Deploying to a remote host](#deploying-to-a-remote-host)
    - [Inventory variables](#inventory-variables)
      - [Docker registry](#docker-registry)
      - [PostgreSQL](#postgresql-1)
      - [Proxy settings](#proxy-settings)
  - [Start the build](#start-the-build-2)
  - [Post build](#post-build-1)
  - [Accessing AWX](#accessing-awx-2)

## Getting started

### Clone the repo

If you have not already done so, you will need to clone, or create a local copy, of the [AWX repo](https://github.com/ansible/awx). For more on how to clone the repo, view [git clone help](https://git-scm.com/docs/git-clone).

Once you have a local copy, run commands within the root of the project tree.

### AWX branding

You can optionally install the AWX branding assets from the [awx-logos repo](https://github.com/ansible/awx-logos). Prior to installing, please review and agree to the [trademark guidelines](https://github.com/ansible/awx-logos/blob/master/TRADEMARKS.md).

To install the assets, clone the `awx-logos` repo so that it is next to your `awx` clone. As you progress through the installation steps, you'll be setting variables in the [inventory](./installer/inventory) file. To include the assets in the build, set `awx_official=true`.

### Prerequisites
