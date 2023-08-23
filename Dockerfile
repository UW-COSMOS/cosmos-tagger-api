FROM node

RUN apt-get update \
 && apt-get install -y libpq-dev postgresql-client

# For development
RUN npm install -g nodemon
WORKDIR /src

COPY package.json /src/
RUN npm install

COPY ./*.* /src/
COPY ./v1-routes/ /src/v1-routes/
COPY ./handlers/ /src/handlers/
COPY ./init-sql /init-sql

# Install all the application modules
COPY ./start-server /src/

CMD ["./start-server"]

