# keycloak-theme-govuk
A Keycloak theme using GOV.UK Template and Elements.

- [Using](#using)
- [Developing](#developing)
    - [Building](#building)
    - [Local Keycloak server](#local-keycloak-server)
    - [Testing Keycloak e-mails](#testing-keycloak-emails)
- [Releasing](#releasing)

## Using
This theme has been deployed to the UK Home Office hosting platform Keycloak Docker container. To use it in your Keycloak realm:

1. Sign into your realm's admin console.

    <img alt="" src="docs/images/use-1.png" width="512" height="337">

2. Go to the “Themes” tab in “Realm Settings”

    <img alt="" src="docs/images/use-2.png" width="512" height="370">

3. Select “govuk” as your login theme, and click on “Save”

    <img alt="" src="docs/images/use-3.png" width="512" height="370">

The theme will now be used for all Keycloak log in screens on your realm - including logging in to the admin console. If you sign out, you should see the GOV.UK themed log in screen.

<img alt="" src="docs/images/use-4.png" width="512" height="421">


## Developing

### Building
The theme can be built using the following commands:
```bash
$ npm install
$ npm run build
```
The theme will then be built at `/govuk`, ready for use in the local Keycloak server.

### Local Keycloak server
A local Keycloak server for developing and testing the theme is available as a Docker container.

To bring up the server, make sure you’ve installed and started [Docker Community Edition](https://docs.docker.com/engine/installation/), then use the following commands:
```bash
$ npm install
$ npm run build
$ docker-compose up
```
The Keycloak server will now be available on <http://localhost:8080>. You can log into the Administration Console using “**admin**” as both username and password.

<img alt="" src="docs/images/keycloak-local.png" width="512" height="300">

To enable the GOV.UK theme in the local Keycloak server, follow steps 2 and 3 in [the “Using” section above](#using).

You will now see the GOV.UK theme when logging into the local Keycloak server. Changes made to the theme files in `/govuk` will be visible on the local Keycloak server when you refresh the page in your browser.

### Testing Keycloak e-mails
The local Keycloak server includes MailDev, a mock SMTP server that you can use to receive and view Keycloak e-mails. It is available on <http://localhost:8081>.

To set up the local Keycloak server to send e-mails to MailDev:

1. Log in to [the local Keycloak server](http://localhost:8080).

2. Go to the “Email” tab in “Realm Settings”

3. Enter the following details:

    - Host: **maildev**

    - From: **keycloak@keycloak**

4. Click on “Save”

5. Click on “Admin” in the top-right-hand corner of the page, and click on “Manage Account”

6. Add an e-mail address to the admin account.

    It doesn’t matter what e-mail address you add, as all e-mails will be caught by MailDev. But you do need to add one, otherwise Keycloak will not send e-mails for this account.

The local Keycloak server should now be set up to send e-mails to MailDev. To check that it’s working:

1. Click on the “Back to Security Admin Console” link

2. Click on the “Login” tab in “Realm Settings”

3. Enable “Forgot password”, and click on “Save”

4. Sign out.

5. On the Keycloak log in screen, click on the “Forgot your password?” link

6. Enter your username (**admin**) in the text field, and submit the form.

7. Visit [MailDev](http://localhost:8081). You should see a reset password e-mail from Keycloak.

    <img alt="" src="docs/images/maildev.png" width="512" height="338">


## Releasing
The theme can be packaged for release using the following command:
```bash
$ npm install
$ npm run build
$ npm run dist
```
The theme will then be packaged at `/govuk.tar.gz`.