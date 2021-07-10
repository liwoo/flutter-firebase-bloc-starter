# Firebase Starter Project

Opinion Starter Project with Firebase and Bloc

## Getting Started
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

Check out more information <a href="https://flutter.dev/docs/development/accessibility-and-localization/internationalization#specifying-supportedlocales">here</a>