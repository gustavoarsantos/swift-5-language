//: [Voltar para Type Casting](@previous)

import Foundation
/*:
## Error Handling
>Em Swift, os erros são representados por value types que estejam em conformidade com o protocolo *ErrorType*. Este protocolo indica que um tipo pode ser utilizado para o tratamento de erros.
>Há quatro maneiras de lidar com erros em Swift. Você pode propagar o erro de uma função para o código que chama essa função, manipular o erro usando uma instrução do-catch, manipular o erro como um optional value ou afirmar que o erro não ocorrerá. Cada abordagem é descrita numa secção abaixo.
*/

//: Representanto e lançando Errors
enum VendingMachineError: Error {
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}

//throw VendingMachineError.insufficientFunds(coinsNeeded: 5)

//: Propagating Errors Using Throwing Functions
func canThrowErrors() throws -> String { return "" }
func cannotThrowErrors() -> String { return "" }

//: Exemplo
struct Item {
    var price: Int
    var count: Int
}

class VendingMachine {
    var inventory = [
        "Candy Bar": Item(price: 12, count: 7),
        "Chips": Item(price: 10, count: 4),
        "Pretzels": Item(price: 7, count: 11)
    ]
    var coinsDeposited = 0
    
    func vend(itemNamed name: String) throws {
        guard let item = inventory[name] else {
            throw VendingMachineError.invalidSelection
        }
        
        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }
        
        guard item.price <= coinsDeposited else {
            throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }
        
        coinsDeposited -= item.price
        
        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem
        
        print("Dispensing \(name)")
    }
}

let favoriteSnacks = [
    "Alice": "Chips",
    "Bob": "Licorice",
    "Eve": "Pretzels",
]

func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) throws {
    let snackName = favoriteSnacks[person] ?? "Candy Bar"
    try vendingMachine.vend(itemNamed: snackName)
}
//: vend() está marcado com `try` porque os erros não serão tratados no contexto e sim propagados para buyFavoriteSnack()

//: Tratando Errors usando Do-Catch
var vendingMachine = VendingMachine()
vendingMachine.coinsDeposited = 8

do {
    try buyFavoriteSnack(person: "Alice", vendingMachine: vendingMachine)
    //tudo deu certo, pode aproveitar o snack
} catch VendingMachineError.invalidSelection {
    print("Invalid Selection")
} catch VendingMachineError.outOfStock {
    print("Out of Stock")
} catch VendingMachineError.insufficientFunds(let coinsNeeded) {
    print("Insufficient funds. Please insert an additional $\(coinsNeeded).")
}
// prints "Insufficient funds. Please insert an additional 2 coins."

//: Convertando Errors usando Optional Values
//: >Try? irá tratar o erro propagado de maneira genérica retornando nil em caso de falha.

enum UnluckyError: Error { case unlucky }
func someThrowingFunction() throws -> Int {
    let success = Int.random(in: 0...1)
    if success == 0 { throw UnluckyError.unlucky }
    return Int(success)
}

let x = try? someThrowingFunction()

//Equivalente a
let y: Int?
do {
    y = try someThrowingFunction()
} catch {
    y = nil
}


//: Rethrows

// Quando um parâmetro é uma closure, e esse usa throws, a função só
// exige do/try se a closure passada usa throws
func authenticateUser(method: (String) throws -> Bool) rethrows -> Bool {
    return try method("twostraws")
}

func throwableFunc(_ string: String) throws -> Bool {
    string.isEmpty
}

//authenticateUser não dispara erros
authenticateUser { try throwableFunc($0) }


//será preciso usar try
//authenticateUser dispara erros
//authenticateUser(method: throwableFunc(_:))

//: [Access Control](@next)
