#client vue Dockerfile
FROM node:14.17.5 as build-stage

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY warehouse_v6/package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of your app source files
COPY warehouse_v6 .

ARG DEV=false

# Build the app if not in DEV mode
RUN if [ "$DEV" = "false" ] ; then npm run build ; fi

EXPOSE 8095
CMD [ "npm", "run", "serve" ]