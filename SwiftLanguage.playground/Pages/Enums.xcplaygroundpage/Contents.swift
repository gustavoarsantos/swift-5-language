//: [Closures](@previous)
/*:
## Enum
 >Enum (ou enumerado) é um tipo utilizado para definir uma lista de valores. Podemos fazer uma analogia com o mundo do desenvolvimento web e dizer que toda vez que usaríamos um dropdown de valores na web, podemos usar Enums na Swift.
 >Uma enumeração pode armazenar valores de qualquer tipo e os tipos destes valores podem ser diferentes para cada membro da enumeração. Para declarar um Enum, utilizamos a palavra enum, seguida do nome que daremos ao nosso Enum. Dentro do bloco, utilizamos case (sim, igual ao do switch) para cada opção.
*/
//: Declarando um Enum
enum CompassPoint {
    case north
    case south
    case east
    case west
}

enum Planet {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}
//: Utilizando um enum
var direction: CompassPoint = .west
direction = .east

//: Para extrairmos os valores inseridos em um enum, utilizamos switch
direction = .south
switch direction {
case .north:
    print("Rumo ao norte")
case .south:
    print("Pinguins")
case .east:
    print("Onde o Sol nasce")
case .west:
    print("Onde o céu é azul")
}

let somePlanet = Planet.earth
switch somePlanet {
case .earth:
    print("Planeta azul")
default:
    print("Não conheço")
}



//: Também podemos declarar Enums que recebem diferentes tipos:
/*:
 >Podemos utilizar Enums de maneira fortemente tipada, fazendo com que seus valores sejam sempre do mesmo tipo.
 >Se utilizarmos inteiros, os valores são auto-incrementados se uma sequência não for informada. Não é possível declarar valores iguais.
*/
enum Numbers: Int, CaseIterable {
    case one = 1
    case two
    case three
    case four

    //É possível adicionar variáveis, desde que computadas
    var description: String {
        String(describing: self)
    }

    //E também funções
    func evenOdd() -> String {
        self.rawValue % 2 == 0 ? "Even" : "Odd"
    }
}

Numbers.allCases.forEach {
    print($0.description + ": \($0.evenOdd())")
}


// Associated Values
typealias Velocity = (Double, Double)

enum UserAction {
    case didTap(elementId: String)
    case didSwipe(velocity: Velocity)
}

//let userAction: UserAction = .didSwipe(velocity: (1, 0))
let userAction: UserAction = .didTap(elementId: "Meu elemento")


switch userAction {
case .didSwipe(velocity: let velocity):
    var direction = ""
    switch velocity {
    case (0, 0):
        direction = "Static"
    case (let x, let y):
        direction += y > 0 ? "Bottom" : "Top"
        direction += x > 0 ? "Right" : "Left"
    }
    print("Swiped \(direction)")
case .didTap(elementId: let elementId):
    print("Tap at \(elementId)")
}


// Raw Values
enum ASCIIControlCharacter: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}

// Implicitly Assigned Raw Values
enum PlanetRaw: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}
let earthsOrder = PlanetRaw.earth.rawValue // earthsOrder é 3

enum CompassPointRaw: String {
    case north, south, east, west
}
let sunsetDirection = CompassPointRaw.west.rawValue // sunsetDirection é "west"
//: [Structure and Classes](@next)
