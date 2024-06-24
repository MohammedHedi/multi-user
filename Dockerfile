FROM node:latest

# ARG defaultPort=3600 --build-arg defaultPort=3600

WORKDIR /app

COPY package*.json .

# Install npm dependencies
RUN npm install

# Install nodemon globally for development
RUN npm install -g nodemon

# Install additional npm packages
RUN npm install dotenv mongoose validator bcryptjs jsonwebtoken passport-jwt passport concurrently

RUN npx create-react-app client -use-npm

WORKDIR /app/client
COPY package*.json .
RUN rm -rf .git && \
    npm install react-router-dom && \
    npm install redux && \
    npm install react-redux && \
    npm install redux-thunk && \
    npm install redux-devtools-extension --force && \
    npm install react-scripts --force && \
    npm install axios --force && \
    npm install classnames --force && \
    npm install jwt-decode --force

WORKDIR /app
COPY . .

# ENV PORT=$defaultPort

EXPOSE 3600 3000
# EXPOSE $PORT --env-file ./env

# CMD [ "npm", "start"]
# CMD [ "npm", "run", "server" ]
CMD ["npm", "run", "start:dev"]