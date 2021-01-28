//: [Voltar para Functions](@previous)
/*:
## Closures
>As closures são utilizadas para a criação de funções inline. Com elas podemos criar blocos de códigos que podem atuar como variáveis ou funções. Para quem conhece Objective-C, podemos dizer que as closures são equivalentes aos blocos ou, fazendo uma analogia com outras linguagens de programação, podemos dizer que são como callbacks e lambdas.
*/
//: Closure Expressions
import Foundation

// Sort Function
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func backward(s1: String, s2: String) -> Bool {
    return s1 > s2
}
var reversedNames = names.sorted(by: backward)

// Closure Expression Syntax
reversedNames = names.sorted { (s1:String, s2: String) -> Bool in return s1 > s2 }

// Inferring Type from from Context
reversedNames = names.sorted { s1, s2 in return s1 > s2 }

// Implicit returns from Single-Expression Closures
reversedNames = names.sorted { s1, s2 in s1 > s2 }

// Shorthand Argument Names
reversedNames = names.sorted { $0 > $1 }

// Operator Functions
reversedNames = names.sorted(by: >)


// Trailing Closures
func someFunctionThatTakesAClosure(closure: () -> ()) {
    //will execute the closure
    closure()
    print("After closure")
}
someFunctionThatTakesAClosure(closure: {
    print("called with label")
})
someFunctionThatTakesAClosure {
    print("called without label")
}

reversedNames = names.sorted() { $0 > $1 }
reversedNames = names.sorted { $0 > $1 }

let digitNames: [UInt: String] = [
    0: "Zero", 1: "One", 2: "Two", 3: "Three", 4:"Four",
    5: "Five", 6:"Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers: [UInt] = [16, 58, 510]

let strings = numbers.map { number -> String in
    var number = number
    var output = ""
    repeat {
        output = digitNames[number % 10]! + output
        number /= 10
    } while number > 0
    return output
}
//Will convert digits to its string
print(strings)


// Capturing Values
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    //This var will be updated by the function
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    //Returns the function
    return incrementer
}
let incrementByTen = makeIncrementer(forIncrement: 10)
incrementByTen()
incrementByTen()
incrementByTen()
let incrementBySeven = makeIncrementer(forIncrement: 7)
incrementBySeven()
incrementByTen()

// Closures are Reference Types (like classes)
// Other var pointing to the same closure
let alsoIncrementByTen = incrementByTen
alsoIncrementByTen()

// Escaping Closures
// Closures that are executed after calling function returns

//async
func doAwesomeStuff(handler: @escaping () -> Void) {
    DispatchQueue.global().async {
        handler()
    }
    print("I did something awesome")
}
doAwesomeStuff {
    print("Do stuff")
}

//storage
var completionHandler: (() -> Void)?
func someFunctionWithEscapingClosure(handler: @escaping () -> Void) {
    completionHandler = handler
}
someFunctionWithEscapingClosure {
    print("Stored closure")
}
completionHandler?()





func someFunctionWithNonescapingClosure(closure: () -> Void) {
    closure()
}

class SomeClass {
    var x = 10
    func doSomething() {
        //Self required (ARC)
        someFunctionWithEscapingClosure { self.x = 100 }
        someFunctionWithNonescapingClosure { x = 200 }
    }
}

let instance = SomeClass()
instance.doSomething()
print(instance.x) // Prints "200"
//executing escaping closure
completionHandler?()
print(instance.x) // Prints "100"

//: ## Autoclosures
//Sintax sugar for closures with no parameters


var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print(customersInLine.count) //5

func serve(customer customerProvider: () -> String) {
    print("Servindo \(customerProvider())!")
}
// Will remove from line then serve the customer
serve(customer: { customersInLine.remove(at: 0) } )
print(customersInLine.count) //4
// Same behavior with autoclosure
func serve(customer customerProvider: @autoclosure () -> String) {
    print("Servindo \(customerProvider())!")
}
serve(customer: customersInLine.remove(at: 0) )
print(customersInLine.count) //3
//: @autoclosure(escaping)

var customerProviders: [() -> String] = []
func collectCustomerProviders(_ customerProvider: @autoclosure @escaping () -> String) {
    customerProviders.append(customerProvider)
}
print(customersInLine)

collectCustomerProviders(customersInLine.remove(at: 0))
collectCustomerProviders(customersInLine.remove(at: 0))

print(customersInLine)

print("Agora temos \(customerProviders.count) closures.")
for customerProvider in customerProviders {
    print("Servindo \(customerProvider())!")
}

print(customersInLine)









/*:
 Simulando uma request em um servidor
 */

//Resposta do servido
struct Result {
    let code: Int
}

//Conexão com servidor
class MakeRequest {
    func makeRequest(_ completion: @escaping (Result) -> Void) {
        print("Making the request")
        DispatchQueue.global().asyncAfter(deadline: .now() + 3) {
            print("request completed")
            completion(Result(code: 404))
        }
        print("request sent")
    }
}

class MyView {
    var makeRequest = MakeRequest()
    var someElemeteVisible = false {
        didSet {
            print("elemente was set visible: \(someElemeteVisible)")
        }
    }

    func requestSomething() {
        //request é mandada e closure executada qdo completa
        makeRequest.makeRequest { result in
            switch result.code {
            case 404:
                self.someElemeteVisible = true
            default:
                self.someElemeteVisible = false
            }
        }
    }
}

let myView = MyView()
myView.requestSomething()










//: [Ir para Enums](@next)
