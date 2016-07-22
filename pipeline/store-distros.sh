#!/bin/bash -ex

current_version=$(ruby -e 'tags=`git tag -l v\\*`' \
                       -e 'p tags.lines.map { |tag| tag.sub(/v/, "").chomp.to_i }.max')

if [[ ${current_version} == nil ]];
then
  new_version='1'
else
  new_version=$((current_version+1))
fi


git tag -a v${new_version} -m "${new_version}"

git push --tags

##########

echo ${new_version} > version.txt

new_dist=pci-dss-infra-v${new_version}.tar.gz

tar cvfz ${new_dist} *

aws s3 cp ${new_dist} s3://stelligent-binary-artifact-repo

rm ${new_dist}
