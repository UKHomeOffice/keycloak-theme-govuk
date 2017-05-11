# keycloak-theme-govuk

A Keycloak theme using GOV.UK Template and Elements.

- [How to use](#how-to-use)
- [Developers](#developers)



## How to use

This theme has been deployed to the UK Home Office hosting platform Keycloak Docker container. To use it on your Keycloak realm:

1. Sign into your realm's admin console.

<img alt="" src="docs/images/use-1.png" width="512">

2. Go to the “Themes” tab in “Realm Settings”

<img alt="" src="docs/images/use-2.png" width="512">

3. Select “govuk_latest” as your login theme, and click on “Save”

<img alt="" src="docs/images/use-3.png" width="512">

The theme will now be used for all Keycloak log in screens on your realm - including logging in to the admin console. If you sign out, you should see the GOV.UK themed log in screen.

<img alt="" src="docs/images/use-4.png" width="512">



## Developers

- Updating Keycloak theme files

- Updating GOV.UK projects

- Updating the GOV.UK themes

- Testing

	- Docker

	- Keycloak (localhost:8080)

	- Mailcatcher (MailDev) (localhost:8081)


