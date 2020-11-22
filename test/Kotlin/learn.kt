// main 函数为入口
fun main(args: Array<out String>) {
    //<out String> == <T extends String>. 这里不写也可以(因为String是final的)
}

//kotlin 的 null类型 需要显示指定
fun Nullish() {
    val s: String = ""
    // s = null //编译错误
    val ss: String? = ""
    ss = null   //Ok
}

class Basic {
    //Kotlin 没有基础数据类型(都是包装类), 故而开头都是大写
    fun Type() {
        val byte: Byte = 2  //8bit
        val short: Short = 4    //16bit
        val int = 6 //32bit, 小于Int最大值的, 自动为Int
        val long: Long = 10 //64bit, 大于的, 就是Long
        val long2 = 12L //这样自动推导也是Long
        val bool = true
    }
}

class Control {
    fun loop(): String {
        for(item in 1..5) {}
        for(i in 6 downTo 0 step 2) {}

        var names = arrayOf("A", "B", "C")
        for(index in names.indices) {}
        for((index, value) in names.withIndex()) {}

        do {} while {}

        whi@ while(true) {
            break@whi
            continue
        }
        return ""
    }

    //when是有返回值的
    fun matching(a: Int, b: Int, c: Int = 255) =
        when {
            a > b && a > c -> a,
            b > a && b > c -> b,
            else -> c
        }
    
    fun local() {
        //with 块创建一个局部块, 并设定里面的`this`为`with`的对象
        with(arrayOf(1, 2, 3)) {
            println("${this.size}")
        }
    }

    fun iterartor() {
        (0..5).forEach(::println)
        (0..5).map(::println)
        
        //flat a list
        listOf(1..20, 2..4, 3..4).flatMap(::println)
        
        //有初始值的reduce
        (0..5).fold(10, {a, b -> a+b})
        (0..5).reduce {acc, i -> acc+i}

        (0..5).joinToString(
            separator = "#", prefix = "[前缀]",
            postfix = "[后缀]", limit = 3, truncated = "[省略号]")
            { i -> i }
        
        //不符合条件后continue
        (0..5).filter{ it > 5 }
        //不符合条件后break
        (0..5).takeWhile { it > 5}
    }
}

class Functional {    
    //只有一行代码可以这么写
    private fun max(num: Int, num2: Int) = if (num > num2) num else num2

    //函数返回值为`Unit`, 表示没有返回值也没有`return`的表达式
    fun func(): Unit {}
    
    /*可变参数
    *```调用
    *  val list = shortArrayOf(1, 2, 3, 4, 5)
    *  varfun(*list)
    *  varfun(12, *list)
    *```
    */
    fun varfun(vararg numbers: Short): Short {
        for(i in numbers) {}
    }
    //和上面的可变参数等价
    fun varfun(numbers: Array<Short>): Int{}

    //参数 transform 也是一个简易的lambda表达式
    fun <T, R> lambda(transform: (T) -> R): R {
        val numbers = arrayOf(1, 2, 3)
        //以下几种写法等价

        numbers.map({
            println(it) //it 是默认的iterator名
        })

        //如果最后一个参数是个 lambda, 则可以这么写
        numbers.map() {
            println(it)
        }

        //又因为前面没有其他参数的值, 所以函数调用的括号也可以省略
        numbers.map {
            println(it)
        }

        //map的iter是一个, println参数也只接受一个, 所以可以写成println的引用形式
        numbers.map(::println)
    }
}

//写这里的构造函数称为 主构造函数
// 没有 可见性修饰或注解, `constructor`可以省略
class OOpSimple private @Inject constructor(
    name: String = "default",
    val home: String = "home"   //构造函数里声明 对象属性
) {
    /*伴生对象
     * Kotlin 的static块
     *```调用
     *  Oranted.xxx
     *```
     */
    companion object{}

    //主构造函数块放这里
    //可以有多个, 也可以没有. 执行顺序从上到下
    init {}
    //次构造函数, 可以使用 `this` 来直接或间接(调用别的次构造函数)委托来调用主构造函数
    constructor(name: String, phone: Long) : this(name) {}
    constructor(name: String, age: Int): this(name, 18800008) {}
}

//对象声明
// 初始访问时初始化. 类似于伴生对象, 可以认为是Kotlin的 static 类
object Staticed {}

//接口
interface Inter {
    open fun in() = false
}

//抽象类
abstract class Abs: Inter {
    abstract val a: String
    abstract val b: String
    fun wtf() = true

    //可以用一个抽象成员覆盖一个非抽象的开放成员
    abstract override fun in()
}

//父类
// 需要是`open`的才可以继承. 默认都是`final`的
// 所有Kotlin的类都继承自`Any`类(toString, hashCode, equals)
open class Super(val p: Int) {
    //函数同理
    open fun func() {}
}

//子类
// 支持多继承
class Child : Super(1), Abs {
    //实现抽象类
    override val a: String
        get() = "a"
    override fun in() = false
    
    //重载
    override fun func() {}
    
    //构造函数调用父类的构造函数
    constructor(name: String) : super(2) {}
    
    fun funct(){
        //调用父类(Super)的函数
        super<Super>.func()
        //调用父类(Inter)的函数
        super<Abs>.func()
    }
}

//扩展方法. 类似于Rust中的 impl
fun Child.say() {
    println("Say")
}

//枚举
// 枚举是不可以扩展更多对象的类
// 每一个枚举都是枚举类的实例
// 枚举类除了不能继承以外, 其他的都可以
enum class Enum(val rgb: Int) {
    RED(0xFF0000),
    GREEN(0x00FF00),
    BLUE(0x0000FF),
    WHITE(0xFFFFFF) {
        //枚举常量还可以声明其带有相应方法以及覆盖了基类方法的匿名类
        override fun signal() = RED
    };

    fun func() = println("1")
}
