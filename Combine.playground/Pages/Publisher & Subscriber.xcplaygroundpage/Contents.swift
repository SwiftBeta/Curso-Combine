import UIKit
import Combine

let myArray = ["1", "2", "3", "4"]
let myPublisher = myArray.publisher

//let just = Just(["1", "2", "3", "4"])

let cancellable = myPublisher.sink { isFinished in
    print("isFinished: \(isFinished)")
} receiveValue: { value in
    print("Value received: \(value)")
}

class YoutubeChannel {
    var numberOfSuscribers: Int = 0
}

let justInteger = Just(2222)
let swiftBetaChannel = YoutubeChannel()
justInteger.assign(to: \YoutubeChannel.numberOfSuscribers, on: swiftBetaChannel)
print(justInteger)
swiftBetaChannel.numberOfSuscribers





