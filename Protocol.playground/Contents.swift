import UIKit

protocol Shape {
    var color: UIColor { get set }
    var description: String { get }
    
    func getArea() -> Double
    func getPerimeter() -> Double
}

struct Triangle: Shape {
    var color: UIColor = .blue
    
    let aLength: Double
    let bLength: Double
    let cLength: Double
    
    var hOfP: Double { // half of perimeter
        (aLength + bLength + cLength) / 2
    }
    
    func getArea() -> Double {
        sqrt(hOfP*(hOfP-aLength)*(hOfP-bLength)*(hOfP-cLength))
    }
    
    func getPerimeter() -> Double {
        aLength + bLength + cLength
    }
    
    var description: String {
        "Your \(color.accessibilityName) triangle has \(String(format: "%.2f", getArea())) area and \(String(format: "%.2f", getPerimeter())) perimeter"
    }
}

struct Circle: Shape {
    var color: UIColor = .cyan
        
    let radius: Double
    
    func getArea() -> Double {
        Double.pi * pow(radius, 2)
    }
    
    func getPerimeter() -> Double {
        2 * Double.pi * radius
    }
    
    var description: String {
        "Your \(color.accessibilityName) circle has \(String(format: "%.2f", getArea())) area and \(String(format: "%.2f", getPerimeter())) perimeter"
    }
}

struct Square: Shape {
    var color: UIColor = .red
    
    let sideLength: Double
    
    func getArea() -> Double {
        pow(sideLength, 2)
    }
    
    func getPerimeter() -> Double {
        sideLength * 4
    }
    
    var description: String {
        "Your \(color.accessibilityName) square has \(String(format: "%.2f", getArea())) area and \(String(format: "%.2f", getPerimeter())) perimeter"
    }
}


let triangle = Triangle(aLength: 10, bLength: 30, cLength: 30)
let circle = Circle(radius: 6)
let square = Square(sideLength: 10)

let shapes: [Shape] = [square, circle, triangle]

var fullPerimeter: Double = 0

for i in shapes {
    print(i.description)
    fullPerimeter += i.getPerimeter()
}

print("\nThe total perimeter of all shapes is \(String(format: "%.2f", fullPerimeter))")
