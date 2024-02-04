//: [Previous](@previous)

import Foundation
import Combine


let numberPublisher1 = PassthroughSubject<Int, Never>()
let numberPublisher2 = PassthroughSubject<Int, Never>()

Publishers.Zip(numberPublisher1, numberPublisher2)
    .map { number1, number2 -> Int in
        return number1 + number2
    }
    .sink { sum in
        print("La suma de los dos valores es: \(sum)")
    }

numberPublisher1.send(3)
numberPublisher2.send(5)

numberPublisher2.send(20)
numberPublisher1.send(10)


//: [Next](@next)
