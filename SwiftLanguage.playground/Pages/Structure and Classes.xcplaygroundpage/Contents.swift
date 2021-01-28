//: [Enums](@previous)
/*:
 ## Classes
 >A Programação Orientada a Objetos foi uma grande mudança de paradigma no desenvolvimento de aplicações, trazendo estruturas semelhantes às do mundo real para dentro da programação. Utilizando esse paradigma, podemos construir aplicações robustas e mais eficientes, gerando menos esforço para manutenção e mais reutilização de códigos.
 >Suas instâncias são sempre passadas por referência
 */
/*:
 ## Structs
 >Uma Struct nos permite criar um tipo de dado estruturado que fornece um armazenamento de dados usando propriedades e funcionalidades através de métodos. É semelhante ao conceito de orientação a objetos, mas na verdade o conceito de Struct é mais simples do que uma classe, pois não permite herança.
 >Suas instâncias são sempre passadas por valor, diferentemente de classes, que são passadas por referência.
 */

struct Resolution {
    var width = 0
    var height = 0
}

class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

//: Class and Structure Instances
let someResolution = Resolution()
let someVideoMode = VideoMode()
someVideoMode.resolution = someResolution
print("resolution width: \(someResolution.width)")
print("video width: \(someVideoMode.resolution.width)")

//Value type
someVideoMode.resolution.width = 1280
print(someResolution.width)
print(someVideoMode.resolution.width)

//Reference type
let anotherVideoVar = someVideoMode
someVideoMode.resolution.width = 1920
print(anotherVideoVar.resolution.width)

//: Memberwise Initializers
// Structs tem inicializadores gerados automaticamente
let vga = Resolution(width: 640, height: 480)

//: Value Type
let hd = Resolution(width: 1920, height: 1080)
var cinema = hd
cinema.width = 2048
print("cinema: \(cinema.width) pixels")
print("hd: \(hd.width) pixels")

//: Reference Types
let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0
print("tenEighty frame rate: \(tenEighty.frameRate)")

// Identity Operators
if tenEighty === alsoTenEighty {
    print("mesma instancia")
}


// Classes também são passadas por referência para funcções
func changeResolution(videoMode: VideoMode) {
    videoMode.resolution = Resolution(width: 800, height: 600)
}

changeResolution(videoMode: tenEighty)
print(alsoTenEighty.resolution)
print(tenEighty.resolution)

//: Mutating
//Pra value types, quando um método altera algum valor, temos que usar mutating

struct SimpleStructure {
    var simpleDescription: String = "A simple structure"
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
}

var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescription


enum TriStateSwitch {
    case off, low, high
    mutating func next() {
        switch self {
        case .off:
            self = .low
        case .low:
            self = .high
        case .high:
            self = .off
        }
    }
}
var ovenLight = TriStateSwitch.low
ovenLight.next()
// ovenLight is now equal to .high
ovenLight.next()
// ovenLight is now equal to .off
//: [Properties](@next)
