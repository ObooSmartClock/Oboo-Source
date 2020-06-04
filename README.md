# Oboo Smart Clock Firmware Build System

This buildsystem for the [LEDE Linux distribution](./LEDE-README.md) has been modified by Onion Corporation to build firmware for the Oboo Smart Clock

**Onion Corporation is not responsible for any damage to your device caused by using custom firmware, custom packages, or any other customization activities.**


## Additional Reading

* See `CHANGELOG.md` for a listing of the changes for each firmware version and build
* See `DISCLAIMER.md` for Onion's disclaimer regarding this build system

# Using this Build System

This buildsystem can be used to create packages and firmware for the Oboo Smart Clock. There are two preferred ways to use the buildsystem:

1. Creating and using the Docker image **Recommended method**
2. Running the build system on a Linux system

## Using the Docker Image

The Docker image takes care of all environmental configuration and is the recommended method.Using this method creates a Docker image that can be used to compile the Oboo Smart Clock build system
See this link for more details: https://docs.docker.com/get-started/part2/

System requirements for running this build system:

* Storage Space: 20 GB minimum
* Memory: 4GB RAM minimum
* CPU: 2 cores minimum

> The better the specs of the computer (more CPU cores, more memory) the faster everything will compile. On an 8-core, 16 GB RAM machine the initial compile will take about **half an hour**.

Procedure:

1. Clone the repository by running:
```
git clone git@github.com:ObooSmartClock/Oboo-Source.git
```
2. Change into the `Oboo-Source` directory:
```
cd Oboo-Source
```
3.  Build and tag the docker image by running:
```
docker build -t oboo-source/oboo-source -f Dockerfile .
```

This will produce a docker image with the following artifacts:

* Firmware binaries:
  * Location: `bin/targets/ramips/mt7688/`
  * For Example: `bin/targets/ramips/mt7688/lede-ramips-mt7688-oboo-smart-clock-squashfs-sysupgrade.bin`
* Oboo package files
  * Location: `bin/packages/mipsel_24kc/oboo/`
  * For Example: `bin/packages/mipsel_24kc/oboo/oboo-clock-base_0.0.8-4_mipsel_24kc.ipk`

## Using the Output Files

To access the the built artifacts, run and mount the docker image to your local filesystem:

```
docker run oboo-source/oboo-source \
      -v ~source:bin/targets \
      -v ~packages:bin/packages \
      -it /bin/bash
```

**Firmware binaries** contain an image of the Oboo Smart Clock Linux Operating System. Incorrectly flashing firmware or flashing broken firmware can lead to a bricked device! **Proceed with extreme caution!** *Onion Corporation is not responsible for any damage to your device caused by using custom firmware or packages not built and released by Onion Corporation.*

**Oboo package files** can be installed on Oboo Smart Clock. Transfer the desired `*.ipk` file to the target Oboo Smart Clock's filesystem, and use `opkg install <IPK NAME HERE>` to install/update the package.

## Building Locally

This procedure must be done on an Ubuntu system, as it requires specific software packages in order for the build to succeed.
System requirements for running this build system are similar to the Docker method:

Required additional software packages:

```
sudo apt-get update
sudo apt-get install -y \
    build-essential \
    vim \
    git \
    wget \
    curl \
    time \
    subversion \
    build-essential \
    libncurses5-dev \
    zlib1g-dev \
    gawk \
    flex \
    quilt \
    git-core \
    unzip \
    libssl-dev \
    python-dev \
    python-pip \
    libxml-parser-perl \
    default-jdk
```
## Using the Build System

When run, the build system outputs firmware binaries and package files for the Oboo Smart Clock.

To setup and compile the build system, run the following command:

```
sh build.sh
```

# Automatic Deployments

Each time a commit or Pull Request is pushed to the `master` branch, the CD system will be **automatically** triggered to compile the build system.

The output ipk files from `bin/packages/mipsel_24kc/oboo/` will be made **automatically** available at: http://repo.getoboo.com/oboo-clock/packages/latest/
