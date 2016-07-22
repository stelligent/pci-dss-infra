#!/bin/bash -ex

export AWS_REGION=us-west-2

aws cloudformation delete-stack --stack-name pci-dss-infra-logging-$(hostname)-${BUILD_NUMBER} \
                                --region ${AWS_REGION}
