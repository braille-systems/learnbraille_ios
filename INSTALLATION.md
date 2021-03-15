# Requirements and limitations

## Target platform

 This application is designed to run on IPhones with IOS. In addition, the application can be used on phones with Android OS, but the display style of the app interface may differ from the usual, because the elements for creating the interface of this application designed with IOS-style. Also, correct display and use of the app on tablets is not guaranteed and depends on the support of their compatibility with Flutter-apps.

## System requirements and limitations

 For correct operation of applications on the ***IPhone*** you need:


- IOS version not lower than 8.0


- IPhone model from 4s

 At the moment, all elements of the application are displayed correctly for IPhones with a 6.1-inch display (1792x828 pixels, for example IPhone 11). This information will be updated later.

 For correct operation of applications on the ***Android*** you need:


- Android SDK version not lower than 16 (but it's recommended to use the version starting from 19)

- 
Android OS version starting from 4.1

 To build an application for IOS, you must have ***XCode*** version not lower than 9.0.

 To develop the application, a version of the ***Flutter*** from the stable channel is used. Current information of Flutter compatibility with mobile devices is published [here](https://flutter.dev/docs/development/tools/sdk/release-notes/supported-platforms).


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
