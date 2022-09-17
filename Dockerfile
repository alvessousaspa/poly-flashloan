FROM node:16.17

WORKDIR /

ENV NODE_ENV production

COPY package.json .
RUN yarn set version berry

COPY .yarn tsconfig.json .yarnrc.yml ./
RUN yarn install
COPY . ./
RUN yarn build

CMD [ "node", "dist/index.js" ]
USER node
