//: [Previous](@previous)

import Foundation
import Combine

enum SwiftBetaError: Error {
    case errorStringToInt
}

func mapStringToInt(with stringValue: String) throws -> Int {
    guard let result = Int(stringValue) else {
        throw SwiftBetaError.errorStringToInt
    }
    return result
}

let stringPublisher = PassthroughSubject<String, SwiftBetaError>()

stringPublisher
    .tryMap { value in
        try mapStringToInt(with: value)
    }
    .sink { finished in
    print("Completed \(finished)")
} receiveValue: { value in
    print("Value \(value)")
}

stringPublisher.send("35")
stringPublisher.send("1000")
stringPublisher.send("32")

//: [Next](@next)
