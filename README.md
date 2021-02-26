<h1 align="center">flutter dasktop appliction demo（flutter_widget),includes macos dasktop and linux dasktop</h1>


```dart
Flutter 1.20.4 • channel stable • https://github.com/flutter/flutter.git
Framework • revision fba99f6cf9 (6 days ago) • 2020-09-14 15:32:52 -0700
Engine • revision d1bc06f032
Tools • Dart 2.9.2
```
## macos 运行
```bash
//首先确认是否开启macos-dasktop  
flutter config --enable-linux-desktop:true  
//修复flutter doctor  
flutter run macos  
```


### 打包IOS程序报错

```bash
Warning: CocoaPods installed but not initialized. Skipping pod install.
  CocoaPods is used to retrieve the iOS and macOS platform side's plugin code that responds to your plugin usage on the Dart side.
  Without CocoaPods, plugins will not work on iOS or macOS.
  For more info, see https://flutter.dev/platform-plugins
To initialize CocoaPods, run:
  pod setup
once to finalize CocoaPods' installation.
```

### 运行`pod setup`

```bash
pod setup
```

