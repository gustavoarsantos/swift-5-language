//: [Subscripts](@previous)
//: ## Herança

// Base Class
import UIKit


class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "viajando a \(currentSpeed)km/h"
    }
    func makeNoise() {
    }
}

let someVehicle = Vehicle()
print("Vehicle: \(someVehicle.description)")

class Bicycle: Vehicle {
    var hasBasket = false
}

let bicycle = Bicycle()
bicycle.hasBasket = true

bicycle.currentSpeed = 15.0
print("Bicycle: \(bicycle.description)")


class Tandem: Bicycle {
    var currentNumberOfPassengers = 0
}

let tandem = Tandem()
tandem.hasBasket = true
tandem.currentNumberOfPassengers = 2
tandem.currentSpeed = 22.0
print("Tandem: \(tandem.description)")


// Overriding
// Overriding methods
class Train: Vehicle {
    override func makeNoise() {
        print("Choo Choo")
    }
}
let train = Train()
train.makeNoise()

//Overriding Properties

class Car: Vehicle {
    var gear = 1
    override var description: String {
        return super.description + " na marcha \(gear)"
    }
}
let car = Car()
car.currentSpeed = 25.0
car.gear = 3
print("Car: \(car.description)")

// Overriding Property Observers
class AutomaticCar: Car {
    override var currentSpeed: Double {
        didSet{
            gear = Int(currentSpeed / 10.0) + 1
        }
    }
}
let automatic = AutomaticCar()
automatic.currentSpeed = 35.0
print("AutomaticCar: \(automatic.description)")


//Usando a keyword final, impossibilita a sobrescrita

class User {
    final var name: String

    init(name: String) {
        self.name = name
    }
}

//Propriedade/método
//class AppUser: User {
//    override var name: String {
//        didSet {
//            //do something
//        }
//    }
//}

//Classe
//class AppUser: User {
//}



//: [Type Casting](@next)
