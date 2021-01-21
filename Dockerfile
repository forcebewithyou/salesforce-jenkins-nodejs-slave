FROM image-registry.openshift-image-registry.svc:5000/salesforce-ci/ose-jenkins-agent-nodejs-12-rhel8

USER root

# ENV NODEJS_VERSION=14 \
#     NPM_CONFIG_PREFIX=$HOME/.npm-global \
#     PATH=$HOME/node_modules/.bin/:$HOME/.npm-global/bin/:$PATH \
#     LANG=en_US.UTF-8 \
#     LC_ALL=en_US.UTF-8

# # Install NodeJS
# RUN INSTALL_PKGS="nodejs nodejs-nodemon make gcc-c++" && \
#     yum module enable -y nodejs:${NODEJS_VERSION} && \
#     yum install -y --setopt=tsflags=nodocs --disableplugin=subscription-manager $INSTALL_PKGS && \
#     rpm -V $INSTALL_PKGS && \
#     yum clean all -y

RUN node -v
RUN npm -v

RUN npm install -g sfdx-cli

RUN sfdx --version

# Copy the entrypoint
COPY configuration/* /var/lib/jenkins/

USER 1001

# Run the JNLP client by default
# To use swarm client, specify "/var/lib/jenkins/run-swarm-client" as Command
ENTRYPOINT ["/var/lib/jenkins/run-jnlp-client"]