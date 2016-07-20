#!/bin/bash -ex

mkdir /var/tmp/pci-dss-infra || true

bundle install --path /var/tmp/pci-dss-infra

bundle exec cfn_nag --input-json-path cfn/template-logging.json