#!/bin/bash -ex

mkdir /var/tmp/pci-dss-infra || true

bundle install --path /var/tmp/pci-dss-infra

export AWS_REGION=us-west-2

bundle exec cfn_converge --path-to-stack cfn/template-logging.json \
                         --stack-name something-cool