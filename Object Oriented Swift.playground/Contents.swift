let x = 0
let y = 0

let coordinate : (x: Int, y: Int) = (0,0)
coordinate.x

struct Point {
    let x: Int
    let y: Int
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
    func getSurroundingPoints(withRange range: Int = 1) -> [Point] {
        var results: [Point] = []
        for xCoord in (x - range)...(x + range) {
            for yCoord in (y - range)...(y + range) {
                let coordinatePoint = Point(x: xCoord, y: yCoord)
                results.append(coordinatePoint)
            }
        }
        return results
    }
}

let coordinatePoint = Point(x: 0, y: 0)
let pointsUsingDefault = coordinatePoint.getSurroundingPoints()
let pointsUsingRange = coordinatePoint.getSurroundingPoints(withRange: 2)

let anotherPoint = Point(x: 2, y: 3)
let anotherPointDefault = anotherPoint.getSurroundingPoints()

struct User {
    let name: String
    let age: Int
}

let user = User(name: "Kevin", age: 41)

struct Book {
    let title: String
    let author: String
    let price: Double
}

let myBook = Book(title: "Animal Farm", author: "George Orwell", price: 6.00)

struct Person {
    let firstName: String
    let lastName: String
    
    func getFullName() -> String {
        return firstName + " " + lastName
    }
}

let aPerson = Person(firstName: "Kevin", lastName: "Gann")
let fullName = aPerson.getFullName()

struct RGBColor {
    let red: Double
    let green: Double
    let blue: Double
    let alpha: Double
    
    let description: String
    
    init(red: Double, green: Double, blue: Double, alpha: Double) {
        self.red = red
        self.green = green
        self.blue = blue
        self.alpha = alpha
        
        self.description = "red: \(self.red), green: \(self.green), blue: \(self.blue), alpha: \(self.alpha)"
        
    }
}

let color = RGBColor(red: 1.0, green: 2.0, blue: 3.0, alpha: 4.0)
color.description


