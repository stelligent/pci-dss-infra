#!/bin/bash -ex

env=ci

mkdir /var/tmp/pci-dss-infra || true

bundle install --path /var/tmp/pci-dss-infra

export AWS_REGION=us-west-2

#bundle exec cfn_converge --path-to-stack cfn/template-logging.json \
#                         --stack-name pci-dss-infra-logging-$(hostname)-${BUILD_NUMBER} \
#                         --path-to-yaml env/${env}/logging.yml > logging_output.yml

bundle exec cfn_chain_converge --path-to-stacks cfn/template-logging.json \
                               --stack-names pci-dss-infra-logging-$(hostname)-${BUILD_NUMBER} \
                               --path-to-yaml env/${env}/logging.yml > logging_output.yml
