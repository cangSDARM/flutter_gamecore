import 'package:flutter/material.dart'; //Material Design样式库
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'Config/localizations.dart';
import 'Config/theme.dart';
import 'Layout.dart';
import 'global.dart';
import 'loading.dart';
import 'store/debug.dart';

void main() async {
  try {
    await Global.init();
  } catch (e) {
    print("abort");
  }

//  final counter = new Counter();
//  final textSize = 48;

  runApp(Provider(
    builder: (_) => new Debug(),
    child: MyApp(),
    dispose: (context, _) => print("disposed"),
    create: (BuildContext
        context) {}, //当 Provider 所在节点被移除的时候，它就会启动 Disposer<T>，然后便可以在这里释放资源
  ));

  /**
      如果在 Provider 中提供了可监听对象（Listenable 或者 Stream）及其子类将提示警告。

      可以在 main 方法中通过下面这行代码来禁用此提示。
      Provider.debugCheckInvalidValueType = null;

      这是由于 Provider 只能提供恒定的数据，不能**通知**依赖它的子部件刷新。
      假如想使用一个会发生 change 的 Provider，请使用下面的 Provider。
      ListenableProvider
      ChangeNotifierProvider
      ValueListenableProvider
      StreamProvider
   * */

//第二种声明方式
//    Provider<int>.value(  //管理一个恒定的数据，并提供给子孙节点使用。我们只需要将数据在其 value 属性中声明即可
//      value: textSize,
//      child: ChangeNotifierProvider.value(
//        value: counter,
//        child: MyApp(),
//        //UpdateShouldNotify 用于控制刷新时机
//      ),
//    )
//第三种
//  MultiProvider(
//      providers: [
//        Provider.value(value: textSize),
//        ChangeNotifierProvider.value(value: counter)
//      ],
//      child: MyApp(),
//    ),
//  );

  /**获取数据
   * final _counter = Provider.of<Counter>(context);  //会导致调用的 context 页面范围的刷新
   * _counter.value; _counter.increment;

      body: Consumer2<Counter,int>( //Consumer 极大地缩小控件刷新范围
      builder: (context, Counter counter, int textSize, Widget child) => Center(
      child: Text(
      onPressed: ()=>counter.increment,
      'Value: ${counter.value}',
      style: TextStyle(
      fontSize: textSize.toDouble(),
      ),
      child: child
      ),
      ),
      ),
   * */
}

class MyApp extends StatelessWidget {
// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //build == ReactComponent.render 函数
    return MaterialApp(
      locale: const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans'),
      localizationsDelegates: [
        const AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en'),
        const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans')
        // generic simplified Chinese 'zh_Hans'
      ],
      title: "Flutter",
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: Loading(loadTo: "app"),
      routes: <String, WidgetBuilder>{
        "app": (_) => Layout(),
      },
    );
  }
}
