//: [Previous](@previous)

import Foundation
import Combine

let stringPublisher = PassthroughSubject<String, Never>()

stringPublisher
    .filter { value in value.count > 6 }
    .sink { completion in
    print("Completion: \(completion)")
} receiveValue: { value in
    print("Value: \(value)")
}

stringPublisher.send("Swift")
stringPublisher.send("SwiftBeta")
stringPublisher.send("UIKit")
stringPublisher.send("Combine")

//: [Next](@next)
