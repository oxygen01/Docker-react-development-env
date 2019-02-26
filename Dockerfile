FROM node:latest
# set working directory
RUN mkdir /code
WORKDIR /code
# add `/code/node_modules/.bin` to $PATH
ENV PATH /code/node_modules/.bin:$PATH
RUN apt-get update
RUN npm install -g create-react-app
RUN apt-get install yarn -y
# install and cache app dependencies
ADD package.json /code/package.json
RUN yarn install
# add app
ADD . /code
# start app
CMD ["yarn", "start"]