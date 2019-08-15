ARG BUILD_FROM
FROM $BUILD_FROM

ARG NODE_VERSION
ENV NODE_VERSION $NODE_VERSION

RUN curl --silent -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash \
    && source ~/.nvm/nvm.sh \
    && nvm alias default $NODE_VERSION \
    && nvm use default \
    && rm -rf /home/appuser/.nvm/.cache/

ENV NODE_PATH /home/appuser/.nvm/versions/node/$NODE_VERSION/lib/node_modules
ENV PATH="/home/appuser/.nvm/versions/node/v$NODE_VERSION/bin:${PATH}"

RUN node -v
RUN npm -v
