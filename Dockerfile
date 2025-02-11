FROM node:latest

# Create app directory
WORKDIR /working

# Install app dependencies
COPY package*.json ./

RUN npm install --quiet

# Bundle app source
COPY . .

# Generate build
RUN npm run build

# Move into the directory containing the build artifacts
WORKDIR /working/dist/angularjs-db

# Install http-server
RUN npm install -g http-server

# Set PORT environment variable to 4200 for http-server to use
ENV PORT=4200

CMD [ "http-server" ]
