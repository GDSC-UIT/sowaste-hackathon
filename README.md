![](/assets/logo/logo_full.png)

The application aims to help users classify waste quickly and accurately, while also providing knowledge about waste classification and increasing awareness of the environmental impact of waste.

## Features
The SoWaste application includes AI technology to identify and categorize trash types.
<hr />

**A waste types dictionary and quizzes help users understand how to classify waste.**

**The dictionary is connected to the camera, displaying basic information while users take photos.**

**Environmental news raises awareness on the importance of waste sorting and its impact on the environment.**

**The app also allows users to search for nearby recycling facilities and get driving directions.**
<hr />
Overall, SoWaste helps users accurately sort waste and improve their knowledge of environmental protection in an easy way.

## Mobile Installation

Download APK file <ins>[here](https://drive.google.com/file/d/1DGLuVp5cODrKqdmtiH0tmBRwMKX9eOs-/view?usp=share_link)!</ins>

## Local Installation

**Requirements**:

- Flutter: [https://docs.flutter.dev/get-started/install](https://docs.flutter.dev/get-started/install)
- Dart: [https://dart.dev/get-dart](https://dart.dev/get-dart)

Follow the steps!

```
git clone https://github.com/GDSC-UIT/sowaste.git
cd sowaste
flutter pub get
flutter run

```

**Note**: If you meet the problem from installation, you should:

- Check your internet connection;
- Run `flutter clean` and `flutter run`;
- Delete `graddle-wrapper.jar` file from `android/gradle/wrapper/gradlle-wrapper.jar` and `flutter run`.

Start using app!

```
Using
    - MVVM Architecture
    - GetX for state management
```

# FILE STRUCTURE

**assets : contains all the static assets that are used in the application**

- logo
- icons
- images
- fonts

**lib**

- core
  - themes : eg- define TextTheme, TextStyle..., color
  - utils : static method
  - values :
    - app_assets: contains paths for different images, icons.
    - app_string: contains strings used across entire application .
    - app_constant: initialize the different color variations.
      ...
  - data
    - models : saves the data and associated logic.
    - services : eg- contains api services : authentication , fetch data...
  - global_widgets
- **modules**
  - <module_name>
    - _<module_name>\_binding.dart_ : provide dependencies - controller...
    - _<module_name>\_controller.dart_ : executes the commands and data linked to the View(s)
    - widgets: local widgets
    - screens
- routes
  - _app_pages.dart_ : contains screens corresponding to the route name
  - _app_routes.dart_ : defines route name
- **_main.dart_**
