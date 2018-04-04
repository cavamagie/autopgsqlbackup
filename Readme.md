autopgsqlbackup

This document provides a guide for installing AWX.

## Table of contents

- [Getting started](#getting-started)
  - [Clone the repo](#clone-the-repo)
- [OpenShift](#openshift)
  - [Prerequisites](#prerequisites-1)
    - [Deploying to Minishift](#deploying-to-minishift)


## Getting started

### Clone the repo

If you have not already done so, you will need to clone, or create a local copy, of the [AWX repo](https://github.com/ansible/awx). For more on how to clone the repo, view [git clone help](https://git-scm.com/docs/git-clone).

Once you have a local copy, run commands within the root of the project tree.

### AWX branding

You can optionally install the AWX branding assets from the [awx-logos repo](https://github.com/ansible/awx-logos). Prior to installing, please review and agree to the [trademark guidelines](https://github.com/ansible/awx-logos/blob/master/TRADEMARKS.md).

To install the assets, clone the `awx-logos` repo so that it is next to your `awx` clone. As you progress through the installation steps, you'll be setting variables in the [inventory](./installer/inventory) file. To include the assets in the build, set `awx_official=true`.

### Prerequisites
