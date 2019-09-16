ARG BUILD_FROM
FROM $BUILD_FROM

ARG NODE_VERSION
ENV NODE_VERSION $NODE_VERSION

ENV NVM_DIR=/usr/local/nvm

RUN mkdir $NVM_DIR \
    && curl --silent -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash \
    && source $NVM_DIR/nvm.sh \
    && rm -rf $NVM_DIR/.cache/ \
    && npm install -g yarn

ENV NODE_PATH "$NVM_DIR/versions/node/$NODE_VERSION/lib/node_modules"
ENV PATH "$NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH"

RUN node -v
RUN npm -v
