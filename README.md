<img src="assets/images/logo.png" align="right" width="60px"/>

# Portfolio 💙 [![Licence](https://img.shields.io/github/license/Aaldn/portfolio?color=a51931&style=flat-square)](https://github.com/Aaldn/portfolio/blob/master/LICENSE.md) ![Stars](https://img.shields.io/github/stars/Aaldn/portfolio?color=e3b341&style=flat-square) ![Forks](https://img.shields.io/github/forks/Aaldn/portfolio?color=238636&style=flat-square)

Flutter Portfolio – by [@Aaldn](https://github.com/Aaldn)

[![Flutter 3](https://img.shields.io/badge/Flutter-3.10-02569b.svg?style=flat-square&logo=flutter&logoColor=13b9fd)](https://flutter.dev/)
[![Dart 3](https://img.shields.io/badge/Dart-3.0-0175c2.svg?style=flat-square&logo=dart&logoColor=13b9fd)](https://dart.dev/)
[![Firebase](https://img.shields.io/badge/Firebase--ffcc30.svg?style=flat-square&logo=firebase)](https://firebase.google.com/)

## [Live Demo](https://aladdine.dev) ✨

<img src="assets/screenshots/mockups-1.png">
<img src="assets/screenshots/mockups-2.png">

## Features 🪄

💙 Responsive and adaptive design, inspired by [Brittany Chiang](https://brittanychiang.com)\
💙 Implements the [Riverpod Architecture](https://codewithandrea.com/articles/flutter-app-architecture-riverpod-introduction/) by [Andrea Bizzotto](https://github.com/bizz84)\
💙 Implements a feature-first structure\
💙 Supports multi languages\
💙 Supports multi themes

## Clone and deploy with Firebase 🚀

**Clone the repository:**
```bash
$ git clone https://github.com/Aaldn/portfolio
$ cd portfolio
```

### Generator 🤖

If you haven't already, install [Flutter](https://docs.flutter.dev/get-started/install)

**Run the code generator:**
```bash
$ dart run build_runner build
```
> For more info, see the [build_runner](https://pub.dev/packages/build_runner) documentation


### Firebase 🔥

If you haven't already, install [Firebase CLI](https://firebase.google.com/docs/cli#install_the_firebase_cli)

**1. Log into Firebase:**
```bash
$ firebase login
```

**2. Install the FlutterFire CLI:**
```bash
$ dart pub global activate flutterfire_cli
```

**3. Create a new Firebase project:**
```bash
$ firebase projects:create
? Please specify a unique project id (warning: cannot be modified afterward) [6-30 characters]:
 <my-unique-project-id>
? What would you like to call your project? (defaults to your project ID) <my-unique-project-id>
```

**4. Set the Firebase project for your portfolio:**
```bash
$ firebase use --add
? Which project do you want to add? (Use arrow keys)
❯ <my-unique-project-id>
? What alias do you want to use for this project? (e.g. staging) default
```

**5. Configure your apps to use Firebase:**
```bash
$ flutterfire configure
i Found 1 Firebase projects. Selecting project <my-unique-project-id>.
? Which platforms should your configuration support (use arrow keys & space to select)? › 
✔ android                                                
✔ ios                                                    
  macos                                                  
✔ web                                                    
```

> For more info, see the [Firebase setup](https://firebase.google.com/docs/flutter/setup?platform=ios) documentation

**6. Initialize Firebase Hosting:**
```bash
$ firebase init hosting
? What do you want to use as your public directory? (public) build/web
? Configure as a single-page app (rewrite all urls to /index.html)? (y/N) y
? Set up automatic builds and deploys with GitHub? (y/N) N
```

**7. Deploy:**
```bash
$ flutter build web --web-renderer canvaskit --release
$ firebase deploy --only hosting
```

> Re-deploy whenever you need

## License

This project is licensed under the MIT License - see the [LICENSE](https://github.com/Aaldn/portfolio/blob/main/LICENSE.md) file for details