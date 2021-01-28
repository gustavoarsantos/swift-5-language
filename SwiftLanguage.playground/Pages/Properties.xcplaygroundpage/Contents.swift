//: [Voltar para Structure](@previous)
/*:
## Properties
*/
//: Stored Properties

struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}
var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
rangeOfThreeItems.firstValue = 6
//rangeOfThreeItems.length = 1

//: Stored Properties of Constant Structure Instances
// Se criarmos uma contante Structure não poderemos alterar suas propriedades mesmo elas sendo declaradas como mutáveis
let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)
//rangeOfFourItems.firstValue = 6
// A linha acima reportará erro

//: Lazy Stored Properties
class DataImporter {
    var fileName = "data.txt"
}

class DataManager {
    lazy var importer: DataImporter = {
        let importer = DataImporter()
        importer.fileName = "\(data.count)"
        return importer
    }()
    var data = [String]()
}

let manager = DataManager()
manager.data += ["Some data"]
manager.data += ["Some more data"]
// a instancia de DataImporter ainda não foi criada
print(manager.importer.fileName)
// após o primeiro acesso, a instancia é criada

manager.data += ["Some more data"]
print(manager.importer.fileName)

//: Computed Properties
struct Point {
    var x = 0.0, y = 0.0
}
struct Size {
    var width = 0.0, height = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set { // se nenhum nome for dado o compilador assume newValue para o novo valor
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    }
}
var square = Rect(origin: Point(x: 0.0, y: 0.0), size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square.center
print(initialSquareCenter)
square.center = Point(x: 15.0, y: 15.0)
print("square.origin: (\(square.origin.x), \(square.origin.y))")

//: Read only Computed Properties
struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {
        return width * height * depth
    }
}
let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
print("fourByFiveByTwo: \(fourByFiveByTwo.volume)")
//fourByFiveByTwo.volume = 10

//: Property Observers
class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("totalSteps irá para: \(newTotalSteps)")
        }
        didSet {
            print("totalSteps foi de \(oldValue) para \(totalSteps)")
        }
    }
}
let stepCounter = StepCounter()
stepCounter.totalSteps = 200
stepCounter.totalSteps = 360
stepCounter.totalSteps = 896

//: Type Properties (static)
// Propriedades statica são uteis para guardar valores serão utilizados por todas as instancias daquela classe
struct SomeStructure {
    static let storedTypeProperty = "Some value."
    static func print() {
        Swift.print("static")
    }
}

class SomeClass {
    static let storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 27
    }
}

SomeStructure.print()

//: Property wrapper

@propertyWrapper struct UpperCased {
    var wrappedValue: String {
        didSet { wrappedValue = wrappedValue.uppercased() }
    }

    init(wrappedValue: String) {
        self.wrappedValue = wrappedValue.uppercased()
    }
}

struct User {
    @UpperCased var firstName: String
    @UpperCased var lastName: String
}

let user = User(firstName: "John", lastName: "Doe")
let name = user.firstName + " " + user.lastName



