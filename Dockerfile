FROM node:8.12.0-alpine
RUN npm install --global npm-cli-login
COPY ./entrypoint.sh /usr/local/bin
RUN mkdir /npm \
 && chown -R 1000:1000 /npm
VOLUME /npm
USER 1000
ENTRYPOINT ["entrypoint.sh"]
