#!/bin/bash -ex

bundle install --gemfile pipeline/Gemfile

bundle exec cfn_nag --input-json-path cfn/template-logging.json