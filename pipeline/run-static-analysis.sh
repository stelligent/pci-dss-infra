#!/bin/bash

bundle --gemfile pipeline/Gemfile \
       exec cfn_nag --input-json-path cfn/template-logging.json