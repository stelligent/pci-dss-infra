#!/bin/bash -ex

env=ci

mkdir /var/tmp/pci-dss-infra || true

bundle install --path /var/tmp/pci-dss-infra

export AWS_REGION=us-west-2

source <(bin/yaml_to_env logging_output.yml)

bundle exec rspec cfn/spec
