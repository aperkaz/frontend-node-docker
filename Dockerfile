FROM node

ADD package.json /package.json

ENV NODE_PATH=/node_modules
ENV PATH=$PATH:/node_modules/.bin

RUN npm install

WORKDIR /app
COPY . /app

EXPOSE 3000


ENTRYPOINT ["/bin/bash", "/app/docker-run.sh"]
CMD ["start"]