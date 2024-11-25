# EXAMPLE OF A MULTI-STEP BUILD PROCESS Dockerfile

# BUILD PHASE. "builder" is a tag to denote that this is for the build phase
FROM node:16-alpine AS builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# RUN PHASE.
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
#All we care here is the contents of the build folder (the output of the build)