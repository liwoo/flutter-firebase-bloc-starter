# Overview

## Problem statement

We need a generic Flutter Starter Project that can be forked whenever we want to put a project in production.  Over the years I have developed some strong opinions on what makes a production ready cross platform Flutter App.  And I would like to embed these opinions into a starter project which we will be frequently updating, so as to save us days (weeks!) of boilerplate code!

## Proposed work

We will need to build a project in the latest version of Flutter with the following features:

- Layered Folder Structure, using [Bloc Architecture](https://bloclibrary.dev/#/architecture)
    - src
        - Screens
        - Widgets
        - Blocs
        - Repositories
        - Services (Firebase stuff etc)
        - Data Access (Graphql queries, generated REST Clients etc)
    - tests
        - integration
        - bloc
        - widgets
- [System Themes](https://stackoverflow.com/questions/60232070/how-to-implement-dark-mode-in-flutter) (Dark Mode / Light Mode) - all fonts, colors etc will not be hardcoded but taken from Theme config
- [Internationalization](https://flutter.dev/docs/development/accessibility-and-localization/internationalization) - all string literals/labels will not be hardcoded but taken from i18 config
- Useful Packages
    - [Flutter SVG](https://pub.dev/packages/flutter_svg)
    - [Url Launcher](https://pub.dev/packages/url_launcher)
    - [Google Fonts](https://pub.dev/packages/google_fonts)
    - [Shared Preferences](https://pub.dev/packages/google_fonts)
    - [Sign in with Apple](https://pub.dev/packages/sign_in_with_apple)
    - [Dio](https://pub.dev/packages/dio)
- Integration with Firebase
    - Notifications
    - Database
    - Authentication
- Env Variable File which will keep all secrets and tokens
    - To be used in [CI/CD](https://docs.codemagic.io/building/environment-variables/)
- Integration with MixedPanel for analytics
    - Log everything from the [Bloc Observer](https://bloclibrary.dev/#/fluttertodostutorial?id=bloc-observer) to MixPanel
    - Log [Custom Events](https://mixpanel.com/blog/introducing-custom-events/) as decided by the business
- Automated Tests
    - [Integration](https://www.youtube.com/watch?v=izajHHFSa8o)
    - Unit (typically [Bloc Tests](https://bloclibrary.dev/#/testing) with mocked out Repositories) - we use Interfaces for Repositories so that we can swap them out using [Kiwi](https://pub.dev/packages/kiwi) when testing, or using [Bloc Repositories](https://bloclibrary.dev/#/architecture?id=repository)
    - [Widget](https://flutter.dev/docs/cookbook/testing/widget/introduction) - to test out UI logic, like animations states, etc...

The App will be made up of:

- Welcome Screen
    - Login and Signup Buttons in the center
    - Login/Signup Form to pop up as modal (using Firebase Auth)
    - [Protected Roo](https://bloclibrary.dev/#/flutterlogintutorial)t with bottom navigation and floating button to open modal to create a note
        - [Notes List](https://bloclibrary.dev/#/fluttertodostutorial)
        - Notification List (to be triggered whenever a note has been created by user in Firebase)
        - Settings (to have a toggle theme button)

# Success criteria

The criteria that must be met in order to consider this project a success. 

- Successful integration with Fireabse
- Successful integration with MixPanel
- Successful CI/CD setup
- Running Tests
- Project ReadMe detailing how to set it up with your own accounts and get it running on your machine