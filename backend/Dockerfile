FROM node:latest as base

# CMD ["npm", "install", "-g", "nodemon"]

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

# CMD ["npm", "install"]
# If you are building your code for production
# RUN npm ci --only=production
RUN npm install

# Bundle app source
COPY . .

EXPOSE 3001

CMD [ "npm", "run", "start" ]

# FROM base as production

# ENV NODE_PATH=./build

# RUN npm run build:test