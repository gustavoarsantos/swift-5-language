//: [Extensions And Protocols](@previous)
//: ## Generics

import UIKit

func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt é \(someInt), e anotherInt é \(anotherInt)")

// A função acima é util, porém pode ser usado apenas com Integer
// Se você deseja trocar outros valores como String ou Double presisará criar outras funções

func swapTwoStrings(_ a: inout String, _ b: inout String) {
    let temporaryA = a
    a = b
    b = temporaryA
}

func swapTwoDoubles(_ a: inout Double, _ b: inout Double) {
    let temporaryA = a
    a = b
    b = temporaryA
}

//: Generic Functions
func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
    let temporaryA = a
    a = b
    b = temporaryA
}

swapTwoValues(&someInt, &anotherInt)
print("someInt é \(someInt), e anotherInt é \(anotherInt)")

var someString = "hello"
var anotherString = "world"
swapTwoValues(&someString, &anotherString)
print("someString é \(someString), e anotherString é \(anotherString)")


//: Generic Types
// Non-generic version of a Stack first
struct IntStack {
    var items = [Int]()
    mutating func push(_ item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
}

// Now a Generic version
struct Stack<Element> {
    var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
}
var stackOfStrings = Stack<String>()
stackOfStrings.push("uno")
stackOfStrings.push("dos")
stackOfStrings.push("tres")
stackOfStrings.push("catorce")
print(stackOfStrings.items)

let fromTheTop = stackOfStrings.pop()

// Extending a Generic Type
extension Stack {
    var topItem: Element? {
        return items.isEmpty ? nil : items.last
    }
}

if let topItem = stackOfStrings.topItem {
    print("O item do topo é: \(topItem).")
}

// Extending with constraints
extension Stack where Element == Int {
    var maxValue: Int? {
        items.max()
    }
}
var stackOfInt = Stack<Int>()
stackOfInt.push(0)
stackOfInt.push(-2)
stackOfInt.push(10)
stackOfInt.maxValue


//: Type Constraints
/*
 func someFunction<T: SomeClass, U: SomeProtocol>(someT: T, someU: U) {
 
 }
 */

//Non-Generic
func findIndex(ofString valueToFind: String, in array: [String]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}
let strings = ["cat", "dog", "llama", "parakeet", "terrapin"]
if let foundIndex = findIndex(ofString: "llama", in: strings) {
    print("The index of llama is \(foundIndex)")
}

//Generic
func findIndex<T: Equatable>(of valueToFind: T, in array: [T]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}
let doubleIndex = findIndex(of: 0.1, in: [3.14159, 0.1, 0.25])
let stringIndex = findIndex(of: "Andrea", in: ["Mike", "Malcolm", "Andrea"])


//: Associated Types in protocols
internal protocol AssociatedTypeProtocol {
    associatedtype MyType: Equatable
    
    var value: MyType { get }
}

//Extending with constraints
extension AssociatedTypeProtocol where MyType == Int {
    var description: String { "This is my Int: \(value)" }
}

//class Tst {
//    static func == (lhs: Tst, rhs: Tst) -> Bool {
//        true
//    }
//}

struct AssocitadeTypeStruct: AssociatedTypeProtocol {
    typealias MyType = Int
    var value: MyType
}

let associatedTypeStruct = AssocitadeTypeStruct(value: 10)
associatedTypeStruct.description

//: [Error Handling](@next)
