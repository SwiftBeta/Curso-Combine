//: [Previous](@previous)

import Foundation

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
    .retry(2)
    .sink { finished in
    print("Completed \(finished)")
} receiveValue: { value in
    print("Value \(value)")
}

stringPublisher.send("Combine")
stringPublisher.send("35")
stringPublisher.send("Swift")
stringPublisher.send("SwiftBeta")
stringPublisher.send("32")

//: [Next](@next)
