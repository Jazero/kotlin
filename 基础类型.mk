### 基础类型

- kotlin为null安全语言。因此Byte、Short、Int、Float、Long型变量不能接收null值。应使用Byte？、Short？、Int？、Float？、Long？接收。 前面一种是基本类型，后面一种是包装类型。

- "==" 值比较。"==="引用比较。 

  ```kotlin
  var a:Int = 128
  var b:Int = 128
  a == b  //true
  a === b  //true
  //*******************
  var a: Int? = 128
  var b: Int? = 128
  a == b  //true
  a === b //false 
  //******************
  var a: Int? = 127
  var b: Int? = 127
  a == b  //true
  a === b //true
  //数值被 JVM 虚拟机以字节码的方式物理存储的，127以下不涉及装箱
  
  ```

- var a = 23.456 默认为Double类型。

  ```kotlin
  var a: Float = 23.456  //编译报错。默认为Double类型。
  //**************************
  var f1 :Float= 524.2345678f
  println("f1 的值为 ${f1}")  //f1 的值为 524.23456  //Float类型精度不高
  
  ```

- kotlin提供三种特殊的浮点型数值：**正无穷大**、**负无穷大**、**非数** 

  ```kotlin
  //一个正数除以0.0得到正无穷大。
    var a = 1 
    var b = a / 0.0
    println(b)  //Infinity
  //一个负数除以0.0得到负无穷大
    var a = -1
    var b = a / 0.0
    println(b)  // -Infinity
  //0.0除以0.0 或者对负数开根得到非数
    var a = 0.0/0.0
    println(a)  //NaN
    var a = sqrt(-4.0)//NaN
  
  //所有正无穷大相等，所有负无穷大相等。 正无穷大不等于负无穷大 
    var a = 1 / 0.0
    var b = 2 / 0.0
    var c = -5 / 0.0
    var d = -6 /0.0
    println(a == b)  //true
    println(c == d)  //true
    println(a == c)  //false
  ```

- kotlin不允许直接将Char值当整数使用，也不允许将整数值当Char值来使用。但为Char类型提供了加减运算支持。

  - **Char型值加、减一个整数值** kotin先将Char对应的字符编码进行加、减该整数，然后将计算结果转化成char类型。
  - **两个Char类型相减** kotin将两个Char型值对应的字符编码进行减法运算，最后返回Int类型的值。两个Char类型不能相加。

  ```kotlin
    var a: Char = 'C'
    var b: Int = 2
    println(a)
    println(a + b)  //'E'
    println(a - b)  //'A'
  
    var c = 'D'
    var d = c - a
    println("d的值是：${d},${d is Int}")  //d的值是：1,true
  //  print(c + a) //编译报错
  
  ```

- 表达式类型的自动提升

  当一个表达式中包含多个数值型的值时，整个算术表达式的数据类型将发生自动提升。

  - 所有Byte、Short类型将被提升到Int类型

  - 整个表达式的数据类型自动提升到与表达式中最高等级操作数同样的类型。

    **Byte·····>Short·····>Int·····>Long·····>Float·····>Double**

  ```kotlin
  //表达式将sValue自动提升到Int类型。
  var sValue: Short = 5
  var data = sValue - 2
  println(data is Int)  //true
  
  var b : Byte = 40
  var c : Short = 97
  var i : Int = 23
  var d : Double = .123
  //表达式右边最高为Double类型，结果也转换成Double类型
  println(b+c+i+d)  //160.123
  //右边表达式中两个操作数都为Int类型。右边表达式结果也为Int类型
  var iVal = 3
  val intResult = 23 / iVal
  println(intResult)  //7
  
  println("hello"+'h'+7) // helloh7
  //先计算Char与3相加，最后转成Char类型 再与String类型拼接。
  println('a'+3+"hello") // dhello
  ```

- 布尔型只有一个Boolean类型。只能是ture或false，不能用0或者非0来代表。其他数据类型的值也不能转换成Boolean类型。字符串"true"和"false"不会直接转成Boolean类型。

- 非空类型和可空类型 只有可空类型的变量和常量才能接受null，可空类型不能直接调用方法和访问相关属性。先判断后使用

  ```kotlin
  var a : String? = "123"
  var b = if(a != null) a.length else -1
  println(b) //3
  
  var b :String? = "fkit"
  println(b?.length) //4
  b = null
  println(b?.length) //null
  ```

- Elvis运算 **?:  如果左边表达式结果不为null，则返回左边表达式的值，否则返回右边表达式的值** 

  ```kotlin
  var a : String? = "123"
  var b = if(a != null) a.length else -1
  println(b) //3
  var c = a?.length ?: -1
  println(c)  //3 与上边if else相同
  ```

- 强制调用  将安全调用"?." 改为"!!." 
