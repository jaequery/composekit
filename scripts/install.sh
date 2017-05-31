#!/bin/bash
#
# Please see LICENSE file for details.
#

if [ -x "$(command -v docker)" ]; then
  echo "Docker detected on the machine. Please uninstall before proceeding."
  exit 1
fi

if [[ "$(composekit-env)" == "Linux" ]]; then
  sudo apt-get install -y docker docker-compose
  # Install Docker Machine:
  # Instructions: https://docs.docker.com/machine/install-machine/
  DOCKER_MACHINE_VERSION=v0.10.0
  curl -L https://github.com/docker/machine/releases/download/${DOCKER_MACHINE_VERSION}/docker-machine-`uname -s`-`uname -m` >/tmp/docker-machine
  chmod +x /tmp/docker-machine
  sudo cp /tmp/docker-machine /usr/local/bin/docker-machine
  RUBY_VERSION=$(ruby -v | awk '{ print $2 }')
  if [[ "${RUBY_VERSION}" < "2.1.0p000" ]]; then
    echo "Ruby Version ${RUBY_VERSION} is lower than expected for dory. Please update Ruby."
    exit 1
  fi
  sudo gem install dory

else
  brew install docker docker-machine docker-compose
  brew tap codekitchen/dinghy
  brew install dinghy
  dinghy create --provider xhyve

  echo "$(dinghy env)" >> ~/.zshrc
  echo "$(dinghy env)" >> ~/.bash_profile

fi

