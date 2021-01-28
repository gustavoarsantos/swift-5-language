import Foundation

//: [Voltar para Operadores](@previous)
/*:
## Strings
> Strings em Swift são representadas o tipo String. O conteúdo da string pode ser acessado de várias maneiras, incluindo como um collection de Character. A concatenação de string é realizada com o operador +, e mutabilidade string é gerenciado pela escolha entre let ou var.
*/
//: Declarando uma string vazia
var emptyString = ""
var anotherEmpyString = String()
if emptyString.isEmpty {
    print("Nada aqui")
}

let multiLineString = """

    Multi line

"""

// Mutabilidade da String
var variableString = "Oi"
variableString += " e tchau"

let highlander = "Highlander"
// highlander += " e outro Highlander" // There can be only one

//: Percorrendo uma String
for char in highlander {
    print(char)
}

//: Podemos acessar seus caracteres
// Mostra quantos caracteres tem na String
highlander.count

// Resgata a última posição dos caractere
highlander.last

// Resgata a primeira posição dos caracteres
highlander.first

//: Comparando textos
var name = "Silvio"
var anotherName = "Santos"

(name == anotherName)
(name != anotherName)
//Ordem alfabética
(name > anotherName)
(name < anotherName)

//: Special Characters
let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
// "Imagination is more important than knowledge" - Einstein
let dollarSign = "\u{24}"           // $,  Unicode scalar U+0024
let blackHeart = "\u{2665}"         // ♥,  Unicode scalar U+2665
let sparklingHeart = "\u{1F496}"    // 💖, Unicode scalar U+1F496

//: Raw Strings: Strings são interpretadas sem escapes characters
let specialCharsString = "Here I have some chars like slash \\ and quotes \""
let rawSpecialCharsString = #"Here I have some chars like slash \ and quotes ""#
specialCharsString == rawSpecialCharsString

// Também vale para multi line
print(#"""
Here I have some
chars like slash \ and quotes "
"""#)

// Muito útil com expressões regulares
let regex = #"(\d+)"#
//let regex = "(\\d+)"
print("123 4 56 789".replacingOccurrences(of: regex, with: "$1_", options: [.regularExpression]))

//: ## Accessing and Modifying a String
//: ### String Indices
//: >Caracteres diferentes requerem diferentes quantidades de memoria para serem armazenados,
//: >para determinar qual caracter está em qual posição da string,
//: >você deve iterar sobre os unicodes comecando do fim ou começo da string.
//: >Por essa razão, strings em Swift não podem ser indexadas por integers.

let greeting = "Guten Tag!"
//greeting[0]
greeting[greeting.startIndex]                               // G
greeting[greeting.index(before: greeting.endIndex)]         // !
greeting[greeting.index(after: greeting.startIndex)]        // u
let index = greeting.index(greeting.startIndex, offsetBy: 7)
greeting[index]                                             // a

for index in greeting.indices {
    print("\(greeting[index]) ", terminator: "")
}
print("")
// prints "G u t e n  T a g !"

//: ### Inserting and Removing
// Inserir um caracter em um determinado indice.
var welcome2 = "hello"
welcome2.insert("!", at: welcome2.endIndex)

// Inserir uma string
welcome2.insert(contentsOf:" there", at: welcome2.index(before: welcome2.endIndex))

// Removar um caracter
welcome2.remove(at: welcome2.index(before: welcome2.endIndex))
welcome2

// Remover uma substring
let range = welcome2.index(welcome2.endIndex, offsetBy: -6)..<welcome2.endIndex
welcome2.removeSubrange(range)



//: ## String Interpolation

//Podemos "somar strings"
let a = "a"
let b = "b"
let c = "c"
print(a + b + c)

//Podemos user interpolação
print("\(a)\(b)\(c)")
//Também com raw strins
print(#"\#(a)\#(b)\#(c)"#)

//Com outros tipos
print("Um = \(1)")

//Ou até podemos criar uma customização
struct User {
    var name: String
    var age: Int
}

//extension User: CustomStringConvertible {
//    var description: String {
//        "\(name), \(age) anos de idade"
//    }
//}

//extension String.StringInterpolation {
//    mutating func appendInterpolation(_ value: User) {
//        appendInterpolation("\(value.name), \(value.age) anos de idade")
//    }
//}

let user = User(name: "João da Silva", age: 33)
print("Usuário: \(user)")
//: [Ir para Collection Types](@next)
