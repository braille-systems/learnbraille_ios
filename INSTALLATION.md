# Requirements and limitations

## Target platform

 This application is designed to run on IPhones with IOS. In addition, the application can be used on phones with Android OS.  But the display style of the app interface may differ from the usual, because the elements for creating the interface of this application were designed with IOS-style.

 Also, correct display and use of the app on tablets is not guaranteed and depends on the support of their compatibility with Flutter-apps.


## System requirements and limitations

 For correct operation of the application on ***IPhone*** the following is required:

- IOS version 8.0 or higher

- IPhone 4s or newer

 At the moment, all elements of the application are displayed correctly on IPhone with a 4.7-inch display (1334x750 pixels, for example IPhone 6). App should be scaled without troubles to any higher resolution parameters. This information will be updated later.

 For correct operation of the application on ***Android*** the following is required:

- Android SDK version 16 or higher (but it's recommended to use version 19 and over)

- Android OS version 4.1 or newer

 To build an application for IOS, you must have ***XCode*** version 9.0 or higher.

 To develop the application, a version of the ***Flutter*** from the stable channel is used. Current information about Flutter compatibility with mobile devices is published [here](https://flutter.dev/docs/development/tools/sdk/release-notes/supported-platforms).


# Installation and running

## Installing and running the application for ***users***

 At the moment, the product is not available for launch and transfer as an .ipa file. Later you can download this application in the *AppStore*.


## Installing and running the application for ***the developer***

### Installing on a macOS device

 A developer can start **Learn Braille** application on a *macOS device*. To do this, follow these ***steps***:

- Install *flutter* ( you can find detailed installation information [here](https://flutter.dev/docs/get-started/install/macos) )

- Install *XCode* and *IOS-simulator*. If you want to run the app on an IOS-device, then you need to install *CocoaPods* by writing on the command line these expression: `sudo gem install cocoapods`

- Establish a connection between the IOS-device and the macOS-device according to the instructions given [here](https://flutter.dev/docs/get-started/install/macos)

- Install the *Android Studio* environment for easy development and the necessary flutter packages ( you can read detailed instructions [here](https://flutter.dev/docs/get-started/editor) )

- Make a ***local copy*** of the Learn Braille project from the [repository](https://github.com/braille-systems/learnbraille_ios/tree/main/braille_abc). You can use the following command line expression: `git clone https://github.com/braille-systems/learnbraille_ios.git`

- Run the app on an emulator or physical device by connecting it to a computer when working in an Android Studio.


### Installing on a Linux or Windows devices

 Also a developer can start **Learn Braille** application on a *Linux device* and on a *Windows device*. To do this, follow ***1, 4-6 steps***. You can find more detailed information on installing on a Linux device [here](https://flutter.dev/docs/get-started/install/linux) and on a Windows device [here](https://flutter.dev/docs/get-started/install/windows)


## Building and release an IOS-app

 The assembly of the application into a file in the form of a .ipa is done using the XCode environment on a macOS device or its emulator. To do this, follow these steps:

- Run the flutter file - *"Runner"*  in the XCode

- Configure application information, application icon, build version

- Build the application for the required platform

 More information about building and releasing the app can be found [here](https://flutter.dev/docs/deployment/ios)
