# keycloak-theme-govuk
A Keycloak theme using GOV.UK Template and Elements

## Building
The theme can be built using the following commands:
```bash
$ npm install
$ npm run build
$ npm run dist
```
The theme will then be packaged in `govuk.tar.gz`.

## Local dev environment
A local dev environment is available in the form of docker-compose. To
bring up an environment use the following commands.
```bash
$ npm install
$ npm run build
$ docker compose up
```
Then simply visit http://localhost:8080 in your browser. You will need
to login with the username and password of 'admin' and then set the
login theme to 'govuk'.

A mock SMTP server is available on the host 'maildev' and will also need
to be setup for any realms you wish to use it. Any emails sent to it can
be viewed by visiting http://localhost:8081 .
