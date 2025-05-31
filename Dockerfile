# pull the base image
FROM node:lts-alpine

# set the working direction
WORKDIR /app

# install app dependencies
COPY package.json ./

RUN npm install

# add app
COPY . ./

# start app
CMD ["npm", "start"]