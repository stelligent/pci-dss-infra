#!/bin/bash

gem install cfn-nag

cfn_nag --input-json-path cfn/template-logging.json