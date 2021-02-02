# FROM image-registry.openshift-image-registry.svc:5000/salesforce-ci/ose-jenkins-agent-nodejs-12-rhel8
FROM quay.io/openshift/origin-jenkins-agent-nodejs
RUN npm i -g sfdx-cli
RUN npm i -g sfdx-git-delta
RUN sfdx --version