//: [Previous](@previous)

import Foundation
import Combine

//let intPublisher = PassthroughSubject<Int, Never>()

[35, 32].publisher
    //.map { value in String(value) }
    .filter({ value in
        value == 32
    })
    .sink { value in
    print("Value \(value)")
}

//intPublisher.send(35)
//intPublisher.send(32)

//: [Next](@next)
