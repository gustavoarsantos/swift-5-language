import Foundation
//: [Voltar Collection Types](@previous)
/*: 
## Controle de Fluxo
	Podemos dizer que uma estrutura de controle de fluxo é responsável por repetir um determinado bloco de código até que uma condição específica seja verdadeira. Isso pode parecer confuso a princípio, mas conforme formos avançando, vocês verão que é bem mais tranquilo na prática.
*/

//: ## For-in
//: >usamos for-in para percorrer collections e ranges
for index in 1...5 {
    print("\(index) vezes 5 é \(index * 5)")
}


//Usando for in para o cálculo de potência
let base = 2
let power = 4
var answer = 1
for _ in 1...power {
    answer *= base
}
print("\(base) elevado a \(power) é \(answer)")
//pow(2, 4)

// Percorrendo Array com for in
var semestre = ["Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho"]
for mes in semestre {
    print("Estamos no mês \(mes)")
}

// Retornando em um tupla
for (indice, mes) in semestre.enumerated() {
    print(" Na posição \(indice) o mês \(mes)")
}
// Ou
for indice in 0..<semestre.count {
    semestre[indice] += " modificado"
    print(" Na posição \(indice) o mês \(semestre[indice])")
}

// Percorrendo Dictionary com for in
let numberOfLegs = ["aranha": 8, "formiga": 6, "gato": 4]
for (animalName, legCount) in numberOfLegs {
    print("\(animalName) tem \(legCount) patas")
}

//: [Mais informações](https://docs.swift.org/swift-book/LanguageGuide/ControlFlow.html#ID121)

//: ## While
let end = 10
let scale = 2
var position = 0

while position < end {
    print("Estou na posição \(position)")
    position += scale
}
print("fim")

//: ## Repeat While

position = 0
repeat {
    print("Estou na posição \(position)")
    position += scale
} while position < end
print("fim")


//: [Mais](https://docs.swift.org/swift-book/LanguageGuide/ControlFlow.html#ID124)

//: [Ir para Condicionais](@next)
