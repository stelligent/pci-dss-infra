#!/bin/bash -ex

mkdir /var/tmp/pci-dss-infra || true

bundle install --gemfile pipeline/Gemfile \
               --path /var/tmp/pci-dss-infra

bundle exec --gemfile pipeline/Gemfile \
       cfn_nag --input-json-path cfn/template-logging.json