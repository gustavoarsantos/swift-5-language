//: [Properties](@previous)

//: ## Subscripts

/*
 subscript(index: Int) -> Int {
 get {
 // return an appropriate subscript value here
 }
 set(newValue) {
 // perform a suitable setting action here
 }
 }
 */

struct TimesTable {
    let multiplier: Int
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}
let threeTimesTable = TimesTable(multiplier: 3)
print("six times three is \(threeTimesTable[6])")

// Subscript Usage
var numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
numberOfLegs["bird"] = 2

// Subscript Options
struct Matrix {
    let rows: UInt, columns: UInt
    var grid: [[Double]]

    init(rows: UInt, columns: UInt) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: Array(repeating: 0.0, count: Int(rows)), count: Int(columns))
    }

    private func indexIsValid(row: UInt, column: UInt) -> Bool {
        return row < rows && column < columns
    }

    //Podemos ter múltiplos parametros
    subscript(row: UInt, column: UInt) -> Double {
        get {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            return grid[Int(row)][Int(column)]
        }
        set {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            grid[Int(row)][Int(column)] = newValue
        }
    }
}
//cria matriz 2x2
var matrix = Matrix(rows: 2, columns: 2)
//muda valores
matrix[0, 1] = 1.5
matrix[1, 0] = 3.2
print(matrix)
print(matrix[0, 1])
print(matrix[1, 0])
//let someValue = matrix[2, 2]
// a linha acima causará um erro por conta de index out of bounds



//Type subscript
enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
    static subscript(n: Int) -> Planet {
        return Planet(rawValue: n)!
    }
}
let mars = Planet[4]
print(mars)


//: [Inheritance](@next)
