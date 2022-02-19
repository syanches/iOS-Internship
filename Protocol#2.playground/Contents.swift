import UIKit

// Задание №1
// Написать код, где можно будет сравнивать перечисления.
// Где перечисления могут быть =>, >, <=, < исходя их rating и их названия самого перечисления


enum LessonType {
    case math(rating: Int)
    case nativeLanguage(rating: Int)
    case computerSince(rating: Int)
    case literature(rating: Int)
}

extension LessonType: Comparable {
    static func < (lhs: LessonType, rhs: LessonType) -> Bool {
        switch (lhs, rhs) {
        case (.math(let a), .math(let b)):
            return a < b
        case (.nativeLanguage(let a), .nativeLanguage(let b)):
            return a < b
        case (.computerSince(let a),.computerSince(let b)):
            return a < b
        case (.literature(let a), .literature(let b)):
            return a < b
        default:
            return false
        }
    }
    
    static func > (lhs: LessonType, rhs: LessonType) -> Bool {
        switch (lhs, rhs) {
        case (.math(let a), .math(let b)):
            return a > b
        case (.nativeLanguage(let a), .nativeLanguage(let b)):
            return a > b
        case (.computerSince(let a),.computerSince(let b)):
            return a > b
        case (.literature(let a), .literature(let b)):
            return a > b
        default:
            return false
        }
    }
    
    static func <= (lhs: LessonType, rhs: LessonType) -> Bool {
        switch (lhs, rhs) {
        case (.math(let a), .math(let b)):
            return a <= b
        case (.nativeLanguage(let a), .nativeLanguage(let b)):
            return a <= b
        case (.computerSince(let a),.computerSince(let b)):
            return a <= b
        case (.literature(let a), .literature(let b)):
            return a <= b
        default:
            return false
        }
    }
    
    static func >= (lhs: LessonType, rhs: LessonType) -> Bool {
        switch (lhs, rhs) {
        case (.math(let a), .math(let b)):
            return a >= b
        case (.nativeLanguage(let a), .nativeLanguage(let b)):
            return a >= b
        case (.computerSince(let a),.computerSince(let b)):
            return a >= b
        case (.literature(let a), .literature(let b)):
            return a >= b
        default:
            return false
        }
    }
}

// Задание №2
// Реализуйте протокол Equitable у LessonType
        
extension LessonType: Equatable {
    static func == (lhs: LessonType, rhs: LessonType) -> Bool {
        switch (lhs, rhs) {
        case (.math(let a), .math(let b)):
            return a == b
        case (.nativeLanguage(let a), .nativeLanguage(let b)):
            return a == b
        case (.computerSince(let a), .computerSince(let b)):
            return a == b
        case (.literature(let a), .literature(let b)):
            return a == b
        default:
            return false
        }
    }
}

let isLess = LessonType.literature(rating: 10) < .literature(rating: 40)
let isGreater = LessonType.nativeLanguage(rating: 5) > .nativeLanguage(rating: 15)
let isGreaterOrEqual = LessonType.computerSince(rating: 3) >= .computerSince(rating: 9)
let isLessOrEqual = LessonType.nativeLanguage(rating: 10) <= .nativeLanguage(rating: 40)
let isEqual = LessonType.math(rating: 10) == .math(rating: 10)

print(isLess, isGreater, isGreaterOrEqual, isLessOrEqual, isEqual)

