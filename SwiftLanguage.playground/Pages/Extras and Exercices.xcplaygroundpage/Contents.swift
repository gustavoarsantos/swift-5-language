//: [Previous](@previous)

import XCTest

//: Reduce

let intArray = [0, 1, 2, 3, 4, 5]

let sumOf = intArray.reduce(0) { result, next -> Int in
    result + next
}
intArray.reduce(0, +)

let stringArray = ["a", "b", "c"]
stringArray.reduce("", +)
stringArray.joined()

let anyArray: [Any] = intArray + [1...10, 9.9] + stringArray

anyArray.reduce("") { result, next -> String in
    let result = result + " "
    switch next {
    case let integer as Int:
        return result + "\(integer)"
    case let string as String:
        return result + string
    default:
        return result + String(describing: next)
    }
}




//: Delegate example

protocol ProtocolDelegate: AnyObject {
    func doSomething()
}

class MyClass {
    weak var delegate: ProtocolDelegate?

    func update() {
        delegate?.doSomething()
    }
}

class MyView: ProtocolDelegate {
    let myClass = MyClass()

    init() {
        myClass.delegate = self
    }

    func userDidSomething() {
        myClass.update()
    }

    func doSomething() {
        print("Testing")
    }
}


var myView = MyView()
myView.userDidSomething()



/*:
 Creating an array extension to sort descending, then using it to sort
 a custom type
 */


extension Array where Element: Comparable {
    mutating func sortDescending() {
        self.sort {
            $0 > $1
        }
    }
}


var arr = [1, 2.0, 6, -1]
arr.sortDescending()
print(arr)


struct SortableClass: Comparable {
    var name: String
    var age: Int

    static func < (lhs: SortableClass, rhs: SortableClass) -> Bool {
        switch (lhs, rhs) {
        case (let lhs, let rhs) where lhs.age == rhs.age:
            return lhs.name < rhs.name
        default:
            return lhs.age < rhs.age
        }
    }

    static func == (lhs: SortableClass, rhs: SortableClass) -> Bool {
        lhs.age == rhs.age && lhs.name == rhs.name
    }
}

var arrayNames = [SortableClass(name: "A", age: 20),
 SortableClass(name: "Q", age: 20),
 SortableClass(name: "Z", age: 28)
]

arrayNames.sortDescending()
print(arrayNames.map { "\($0)" })


/*:
 You have to write an algorithm that flatten an arrays structure to 2 levels. It means that each array under the second level will be merge to its parent. Only two levels are kept.

 Empty arrays are ignored.


 [Code wars](https://www.codewars.com/kata/5227129b316b56d50d0003b7/train/)
 */

func flatten(_ arr: [Any]) -> [Any] {
    return arr.reduce([]) { arr, item -> [Any] in
        guard let itemArr = item as? Array<Any> else {
            return arr + [item]
        }

        return arr + flatten(itemArr)
    }
}

func flattenTwoLevels(_ arr:[Any]) -> [Any] {
    arr.map { item -> Any in
        guard let itemArr = item as? Array<Any> else {
            return item
        }

        return flatten(itemArr)
    }
}

print(flattenTwoLevels([1, [2, 3], [4, 5, [6, 7, 8], 9, 10, [11, [12, [13, 14], 15], 16], 17], 18]))
print([1,[2,3],[4,5,6,7,8,9,10,11,12,13,14,15,16,17], 18])
print("")
print(flattenTwoLevels([1, 2, 3]))
print([1,2,3])
print("")
print(flattenTwoLevels([1, [2], 3, [4, 5]]))
print([1,[2],3,[4,5]])
print("")
print(flattenTwoLevels([1,[2, 3, [], [4, [], 5]]]))
print([1,[2,3,4,5]])
print("")
print(flattenTwoLevels([[1, 2, 3], [4, 5, [6, 7, [8]]], 9]))
print([[1, 2, 3], [4, 5, 6, 7, 8], 9])



/*:
 Create a function add(n)/Add(n) which returns a function that always adds n to any number

 Note for Java: the return type and methods have not been provided to make it a bit more challenging.

 [Code wars](https://www.codewars.com/kata/538835ae443aae6e03000547/train/swift)
 */

func add(_ n: Int) -> ((Int) -> Int) {
  { $0 + n }
}
