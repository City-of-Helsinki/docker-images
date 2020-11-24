ARG BUILD_FROM
FROM $BUILD_FROM

ARG NODE_VERSION
ENV NODE_VERSION $NODE_VERSION

ENV NVM_DIR=/usr/local/nvm

RUN mkdir $NVM_DIR \
    && curl --silent -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.0/install.sh | bash \
    && source $NVM_DIR/nvm.sh \
    && rm -rf $NVM_DIR/.cache/ \
    && ln -sT /usr/local/nvm/versions/node/$(node -v) /usr/local/nvm/versions/node/default \
    && npm install -g yarn

ENV NODE_PATH "$NVM_DIR/versions/node/default/lib/node_modules"
ENV PATH "$NVM_DIR/versions/node/default/bin:$PATH"

RUN node -v
RUN npm -v
