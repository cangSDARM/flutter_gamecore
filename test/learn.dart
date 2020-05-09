//-------------------------------------------------------------------------------------------Dart
// @formatter:off

//import '' as ImporterName;
/*延时加载, 调用时加载
  import '' deferred as ImportName;
  ImportName.loadLibrary();
    /* Use ImportName */
*/

// 每个 Dart项目 必须有个 void main() 函数
void main(){}

//Dart 对象
//继承和Javascript一样，用 extends, 单继承
//存在抽象类 abstract class
abstract class Objects extends Object{
  void func();  //virtual method
  void say(){ print('abstract'); }
}
//mixin. 不同于接口, 这是混合其他的已实现的方法, 使用 with 关键字. (存在重名方法时, 按照先自己后从右至左的方式查找调用第一个)
abstract class Eat{}
mixin Sleep on Objects{} //^Dart2.1 使用mixin而非abstract, on 表示使用超类的方法
class Person extends Objects with Eat, Sleep{

  //对象字段
  String name;
  int age;
  static Map<bool, double> maps;

  //构造函数
  Person(this.name, this.age) : super();

  //对象方法
  void run() {
    //字符串拼接，和JavaScript类似，但用的是 ""
    print("${this.name}");
  }

  //重写父类方法
  @override //override可以省略
  void func() {
    print("""
      多行字符串
    """ "字符串拼接可以使用 空格/_/#/+ 来拼接. 多行只能使用 +/空格, 空格数量不影响, 不会输出用于拼接的字符");
  }
}
//调用
// Dart 对象new 时，可以省略 new 关键字
void textObj(){
  var p = Person("name", 2);
  p.run();
}

/*Dart 函数
  有三种定义方式：
      标准：void func(){}
      默认返回值类型为dynamic：func(){}
      只能执行一条语句：void func(err) => print(err);
  参数:
      normal: void func(int user, String use){}
      可选: void func( int user, [String use]){ print(use ? use : 'use') }
      默认: void func(int user,  {String use='use'}){ print(use) }
            func(1, use: 'use');  //默认值调用使用引号
      匿名函数: void (){}
*/

/*Dart 类型
  1. 是类型安全的动态语言，所以可以声明变量类型也可以不声明（使用var）。但推荐声明
  2. 未初始的变量为 null，包括数字
*/

/*Dart 类型的判断
  1. null值判断。很类似于C#
      例. outgoing[a]?.contains(b) ?? false
      （先判断outgoing[a]是否存在，之后判断contains是否返回null）
      ?. 在左边为null时阻断右侧调用，并返回null
      ?? 左侧为 null 时返回 true
*/

/*Dart 的异步操作
  1. Future，类似于javascript的Promise
    HttpRequest.request(url).then().catchError((err)=> print(error));
  2. async await，同JS的 async await，但写的位置不尽相同
    void func() async {
        final url = 'https://httpbin.org/ip';
        var req = await HttpRequest.request(url);
        String ip = json.decode(req.responseText)['origin'];
        print(ip)
    }
  3. 自带delay
    Future.delayed(new Duration(seconds: 5), (){});
  4. 等待多个
    Future.wait([ future1, future2 ]);
  5. 自定义Future
    Completer
*/
