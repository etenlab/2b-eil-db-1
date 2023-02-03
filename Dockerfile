FROM node:16

# Create app directory
WORKDIR /usr/src/etenlab/database-api

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./
COPY tsconfig*.json ./
COPY src ./

RUN grep -e react-dom package-lock.json
RUN npm ci --registry=https://registry.npmjs.org
RUN npm run build

CMD [ "npm", "run", "start:prod" ]