# Flutter

## 官方网址

Dart: [dart.dev](https://dart.dev/guides/language)<br/>
Dart 中文网：[dart china](https://www.dartcn.com/)<br/>
Web IDE：[dart pad: the china mirror](https://dartpad.cn)<br/>
Flutter：[flutter dev](https://flutter.dev/)<br/>
Flutter 中文网：[flutter china](https://flutterchina.club/docs/)<br/>

## 项目结构
```markdown
 |- ProjectName
      |- android  安卓部分的工程文件
      |- build    项目的输出目录
      |- ios      IOS部分的工程文件
      |- lib      项目的源文件
           |- main.dart    自动生成的入口文件，类似于React的index.js
      |- test     项目测试文件
      |- pubspec.yaml      项目的依赖配置文件，类似于React的package.json
```

## 项目依赖
+ android 特定依赖：使用 Gradle
+ ios 特定依赖：使用 Podfile
+ flutter 依赖：使用 pubspec
镜像设置：[tuna mirror](https://mirrors.tuna.tsinghua.edu.cn/help/dart-pub/)<br/>
搜索：[pub-flutter.io](https://pub.flutter-io.cn/)<br/>
导入：
```yaml
dependencies:
    flutter:
        sdk: flutter
    google_sign_in: ^3.0.3
```
下载：`flutter packages get`

## 静态资源管理
flutter的资源可以是任意类型的文件。<br/>
1. 配置assets: in pubspec.yaml
```yaml
    flutter:
        assets:
            - assets/data.json      # assets文件夹下(assets和lib同级)
            - img/myimg.jpeg   # img文件夹下(img和lib同级, 不同的device pixel ratio放在对应的img/.../中)
```
2. 访问
```dart
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

Future<String> loadAsset() async{
    return await rootBundle.loadString('assets/data.json';
}
image: DecorationImage(
    image: AssetImage('img/myimg.jpeg'),
),
```

## 国际化
flutter暂时没有内置的i18n，需要自己实现。下面是一种实现
```dart
//define
class StaticStrings{
    static String welcomeInfo = "welcome to flutter";
}
//usage
Text(StaticStings.welcomeInfo);
```
且flutter默认只支持ascii码，如要引入其他语言需要引入其他包：
```yaml
dependencies:
    flutter_localization:   #其他文字支持
        sdk: flutter
    intl: "^0.15.6"     #另一个i18n包，如日期/时间格式化
```
还需要在app widget中引入
```dart
import 'package:flutter_localization/flutter_localization.dart';
MaterialApp(
    localizationsDelegates: [
        //Add app-specific localization delegate[s] here
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,    //使用基础的Widgets样式包的话，不需要这个
    ],
    supportedLocales: [
        //Add your application can support location code here
        const Locale('en', 'US'),
        const Locale('he', 'IL'),
    ],
    //...
);
```
其他注意：<br/>
1. 初始化时，会使用指定的代理来创建一个`Localizations widget`。使得可以从当前上下文来访问设备`local`信息，或者使用`Window.locale`
2. 要访问本地化文件，使用`Localizations.of()`方法来访问指定的本地化类。如需翻译，使用`intl_translation`包来翻译到`arb`文件中。把它们引入App中，再通过`intl`来使用
3. 更多信息：[internationalization guide](https://flutter.dev/docs/development/accessibility-and-localization/internationalization)

## 和RN比较
Flutter和React很相似，都是声明式框架<br/>
> Flutter.runApp(Component()) == React.render(<Component/>, document.getElementById("root"))
> Flutter.Widget == React.Component
> Flutter.StatefulWidget == React.状态式组件
> Flutter.StatelessWidget == React.无状态组件

## PS
1. Flutter 里涉及数字的，都是double类型
2. android studio check unused: 选中类型 -> 右键find usages -> value read
