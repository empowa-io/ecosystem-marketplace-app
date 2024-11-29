# Use the official Node.js 18 image as the base image
FROM node:18

# Set the working directory inside the container
WORKDIR /app


ENV NEXT_PUBLIC_GRAPHQL_SCHEMA ./schema.graphql

COPY packages/marketplace-ui .


RUN --mount=type=cache,target=/root/.yarn YARN_CACHE_FOLDER=/root/.yarn yarn install

RUN yarn install

WORKDIR /app/applications/marketplace-demo

COPY schema.graphql . 


# ENV NEXT_PUBLIC_GRAPHQL_API_ENDPOINT=http://0.0.0.0:9001/
# ENV NEXT_PUBLIC_GRAPHQL_SCHEMA ./schema.graphql
# ENV NEXT_PUBLIC_ENV "production"
# ENV NEXT_PUBLIC_IPFS_GATEWAY_URL https://cdn.empowa.app/ipfs
# ENV NEXT_PUBLIC_BLOCKFROST_API_KEY preprodO7rqlmTs23gobolbUgZ42K4cLVn0H5rr
# ENV NEXT_PUBLIC_CARDANO_NETWORK preprod

# RUN yarn build

# RUN printenv

EXPOSE 3000

# # Start the application
CMD yarn dev
