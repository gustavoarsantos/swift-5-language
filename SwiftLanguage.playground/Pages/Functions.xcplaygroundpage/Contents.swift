//: [Voltar para Condicionais](@previous)
/*: 
## Funções
 >Every function has a specific function type, made up of the parameter types and the return type of the function.
*/
//: Criando uma função
//: Function sem parâmetros
func sayHelloWorld() -> String {
    "hello, world"
}
print(sayHelloWorld())

//: Function com parâmetros
func greet(person: String) -> String {
    let greeting = "Olá, " + person + "!"
    return greeting
}
print(greet(person: "Carlos"))
print(greet(person: "Alberto"))

func greetAgain(person: String) -> String {
    return "Olá denovo, " + person + "!"
}
print(greetAgain(person: "Carlos Alberto"))

//: Múltiplos parâmetros
func greet(person: String, alreadyGreeted: Bool) -> String {
    if alreadyGreeted {
        return greetAgain(person: person)
    } else {
        return greet(person: person)
    }
}
print(greet(person: "Giovana", alreadyGreeted: true))

//: Functions sem retornos
func greet2(person: String) {
    print("Olá, \(person)!")
}
greet2(person: "Giovana")

func printAndCount(string: String) -> Int {
    print(string)
    return string.count
}
func printWithoutCounting(string: String) {
    _ = printAndCount(string: string)
}
printAndCount(string: "hello, world")
printWithoutCounting(string: "hello, world")

//: Functions com multiplos retornos
func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}
let bounds = minMax(array: [8, -6, 2, 109, 3, 71])
print("minimo é \(bounds.min) e o maximo é \(bounds.max)")

//: Optionals
func minMaxSafe(array: [Int]) -> (min: Int, max: Int)? {
    guard !array.isEmpty else { return nil }
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}
if let bounds = minMaxSafe(array: [8, -6, 2, 109, 3, 71]) {
    print("minimo é \(bounds.min) e o maximo é \(bounds.max)")
} else {
    print("não foi possível determinar")
}

//: Parameter Labels
// Especificando um label
func greet(person: String, from hometown: String) -> String {
    "Olá \(person)! Você mora em \(hometown)."
}
greet(person: "Zeca", from: "Champinas")

// Omitindo um parametro && Default value
func greet(_ person: String = "Mundo", from hometown: String = "Universo") -> String {
    "Olá \(person)! Você mora em \(hometown)."
}
greet(from: "Argentina")

// Parametro variado
func arithmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
arithmeticMean(1, 2, 3, 4, 5)
arithmeticMean(3, 8, 19)
//: In-Out Parameters
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}
var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt é \(someInt), e anotherInt é \(anotherInt)")

//: Function Types
//> você pore definir uma variável ou constante para ser do tipo de uma função:

func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}
func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    return a * b
}

var mathFunction: (Int, Int) -> Int = addTwoInts
print("Result: \(mathFunction(2, 3))")

mathFunction = multiplyTwoInts
print("Result: \(mathFunction(2, 3))")

let anotherMathFunction = addTwoInts

// Function Types como parâmetro
func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a, b))")
}
printMathResult(addTwoInts, 3, 5)

// Function Types como retorno
func stepForward(_ input: Int) -> Int {
    return input + 1
}
func stepBackward(_ input: Int) -> Int {
    return input - 1
}

func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    return backward ? stepBackward : stepForward
}

var currentValue = -3
let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)

print("Counting to zero:")
while currentValue != 0 {
    print("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}
print("zero!")


// Nested Functions
// somente visível dentro do escopo da função
func chooseAnotherStepFunction(backward: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int { return input + 1 }
    func stepBackward(input: Int) -> Int { return input - 1 }
    return backward ? stepBackward : stepForward
}
currentValue = -4
let moveNearerToZeroAgain = chooseAnotherStepFunction(backward: currentValue > 0)
while currentValue != 0 {
    print("\(currentValue)... ")
    currentValue = moveNearerToZeroAgain(currentValue)
}
print("zero!")
//: [Ir para Closures](@next)
