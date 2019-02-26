FROM node:latest
# set working directory
RUN mkdir /usr/src/app
WORKDIR /usr/src/app
# add `/usr/src/app/node_modules/.bin` to $PATH
ENV PATH /usr/src/app/node_modules/.bin:$PATH
RUN apt-get update
RUN npm install -g create-react-app
RUN apt-get install yarn -y
# install and cache app dependencies
ADD package.json /usr/src/app/package.json
RUN yarn install
# add app
ADD . /usr/src/app
# start app
CMD ["yarn", "start"]