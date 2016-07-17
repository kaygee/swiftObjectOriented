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

struct SimplePerson {
    let firstName: String
    let lastName: String
    
    func getFullName() -> String {
        return firstName + " " + lastName
    }
}

let aPerson = SimplePerson(firstName: "Kevin", lastName: "Gann")
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

class Enemy {
    var life: Int = 2
    var position: Point
    
    init(x: Int, y: Int) {
        self.position = Point(x: x, y: y)
    }
    
    func decreaseHealth(factor: Int) {
        life -= factor
    }
}

class Shape {
    var numberOfSides: Int
    
    init(numberOfSides: Int) {
        self.numberOfSides = numberOfSides
    }
}

let someShape = Shape(numberOfSides: 3)

class Tower {
    let position: Point
    var range: Int = 1
    var strength: Int = 1
    
    init(x: Int, y: Int) {
        self.position = Point(x: x, y: y)
    }
    
    func fireAtEnemy(enemy: Enemy) {
        if (inRange(position, range: self.range, target: enemy.position)) {
            while enemy.life > 0 {
                enemy.decreaseHealth(self.strength)
                print("Enemy in range! Firing!")
            }
            print("Enemy vanquished!")
        } else {
            print("Enemy out of range!")
        }
    }
    
    func inRange(position: Point, range: Int, target: Point) -> Bool {
        let availablePositions = position.getSurroundingPoints(withRange: range)
        for point in availablePositions {
            if (point.x == target.x) && (point.y == target.y) {
                return true
            }
        }
        return false
    }
}

let tower = Tower(x: 0, y: 0)
let enemy = Enemy(x: 1, y: 1)
let farAwayEnemy = Enemy(x: 5, y: 5)

tower.fireAtEnemy(enemy)
tower.fireAtEnemy(farAwayEnemy)

struct Location {
    let latitude: Double
    let longitude: Double
}

class Business {
    let name: String
    let location: Location
    
    init(name: String, location: Location) {
        self.name = name
        self.location = location
    }
}

let someBusiness = Business(name: "5AM", location: Location(latitude: 1.0, longitude: 3.0))

class SuperEnemy: Enemy {
    let isSuper: Bool = true
    
    override init(x: Int, y: Int) {
        super.init(x: x, y: y)
        self.life = 50
    }
    
}

let superEnemy = SuperEnemy(x: 1, y: 1)

class LaserTower: Tower {
    
    override init(x: Int, y: Int) {
        super.init(x: x, y: y)
        self.range = 100
        self.strength = 100
    }
    
    override func fireAtEnemy(enemy: Enemy) {
        while enemy.life >= 0 {
            enemy.decreaseHealth(strength)
        }
        print("Enemy friggin' lazered!")
    }
    
}

let laserTower = LaserTower(x: 5, y: 5)
laserTower.fireAtEnemy(superEnemy)

class Vehicle {
    var numberOfDoors: Int
    var numberOfWheels: Int
    
    init(withDoors doors: Int, andWheels wheels: Int) {
        self.numberOfDoors = doors
        self.numberOfWheels = wheels
    }
}

class Car: Vehicle {
    var numberOfSeats: Int = 4
}

let someCar = Car(withDoors: 4, andWheels: 3)

class Person {
    let firstName: String
    let lastName: String
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    func getFullName() -> String {
        return "\(firstName) \(lastName)"
    }
}

class Doctor: Person {
    override func getFullName() -> String {
        return "Dr. \(lastName)"
    }
}

let someDoctor = Doctor(firstName: "Kevin", lastName: "Gann")
someDoctor.getFullName()
