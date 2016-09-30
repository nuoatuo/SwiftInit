//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

#if false
    class Person {
        var name: String = ""
        var age: Int = 0
        
        //在Swift开发中，如果在对象函数中，用到成员属性，那么“self.”可以省略
        //注意：如果在函数中，有和成员属性重名的局部变量，那么“self.”不可省略
        
        //注意：如果有自定义构造函数，那么会将系统提供的构造函数覆盖掉
        init() {
        }
        
        init(name: String, age:Int) {
            self.name = name
            self.age = age
        }
        
        init(dict: [String : Any]) {
            if let name = dict["name"] as? String {
                self.name = name
            }
            
            if let age = dict["age"] as? Int {
                self.age = age
            }
        }
    }
    
let p1 = Person()
let p2 = Person(name: "why", age: 18)
let p3 = Person(dict: ["name" : "Any", "age": 18])
print(p3.name, p3.age)
#endif

/*
 使用KVC条件
 1>必须继承自NSObject
 2>必须在构造函数中，先调用super.init()
 3>调用setValuesForKeys
 4>如果字典中某一个key没有对应的属性，则需要重写setValue forUndefinedKey方法，防止程序崩掉
 */

class Person : NSObject{
    var name: String = ""
    var age: Int = 0
    var height: Double = 0.0
    
    init(dict: [String : Any]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
    }
}

let p = Person(dict: ["name":"why", "age": 18, "height":20.0, "phoneNum":"+86 120"])
print(p.name, p.age, p.height)

