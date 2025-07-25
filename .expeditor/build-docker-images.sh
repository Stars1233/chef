#! /bin/bash
set -eou pipefail

#set expeditor_version equal to the version file
export EXPEDITOR_VERSION=$(cat VERSION)

arch=$1

if [[ $arch == "arm64" ]]; then
  dockerfile_arch="aarch64"
else
  dockerfile_arch="x86_64"
fi

channel="${EXPEDITOR_CHANNEL:-unstable}"
version="${EXPEDITOR_VERSION:?You must manually set the EXPEDITOR_VERSION environment variable to an existing semantic version.}"

echo "--- Building chef/chef-hab:${version} docker image for ${arch}"
docker build \
  --build-arg "CHANNEL=${channel}" \
  --build-arg "VERSION=${version}" \
  --build-arg "ARCH=${dockerfile_arch}" \
  -t "chef/chef-hab:${version}-${arch}" .

echo "--- Pushing chef/chef-hab:${version} docker image for ${arch} to dockerhub"
docker push "chef/chef-hab:${version}-${arch}"
