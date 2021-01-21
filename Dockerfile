FROM image-registry.openshift-image-registry.svc:5000/salesforce-ci/ose-jenkins-agent-nodejs-12-rhel8

RUN npm i -g sfdx-cli
RUN npm i -g sfdx-git-delta
RUN sfdx --version