# Firebase Starter Project

Opinion Starter Project with Firebase and Bloc

## Getting Started
### Authentication
#### Android Setup
- [Register your app](https://firebase.google.com/docs/android/setup), configure the [signing key](https://flutter.dev/docs/deployment/android#signing-the-app) and add the [signing keys' SHA1](https://developers.google.com/android/guides/client-auth) fingerprints to the firebase app.
- Fill out the [OAuth consent screen](https://console.developers.google.com/apis/credentials/consent) 
- Add ```.../auth/userinfo.email``` and ```.../auth/userinfo.profile``` scopes
- Activate the google login method in the firebase console
## Firebase Notification
### Intergration
- ### Android Intergration
    Android intergration to firebase does not need any additional steps.
- ### IOS Intergration
    iOS & macOS require additional configuration before you can start receiving messages through Firebase, [Setup instructions](https://firebase.flutter.dev/docs/messaging/apple-integration)
### Handling Messages
Depending on the device state messages are handled differently. These states are Foreground, Background and Terminated.
#### Foreground
#### Background
### Localization
The Localisation is using the ``flutter_localizations`` and ``intl`` packages.

The default template file is `` ${FLUTTER_PROJECT}/lib/l10n/app_en.arb``, if you want to add new localisation add the new files in `` ${FLUTTER_PROJECT}/lib/l10n/ `` with the language suffix for example `` app_es.arb ``.

The supported locales will be automatically added according to the template files in the I10n folder.

Example template file

``` json
{
    "helloWorld": "Hello World!",
    "@helloWorld": {
    "description": "The conventional newborn programmer greeting"
}
```

Check out more information [here](https://flutter.dev/docs/development/accessibility-and-localization/internationalization#specifying-supportedlocales)