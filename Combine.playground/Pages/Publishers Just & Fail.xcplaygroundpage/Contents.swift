//: [Previous](@previous)

import Foundation
import Combine

struct User {
    let email: String
    let name: String
}

let user: User = .init(email: "swiftbeta.blog@gmail.com",
                       name: "SwiftBeta")

let justPublisher = Just(user)

/*justPublisher.sink { completion in
    switch completion {
    case .failure(let error):
        print("Error \(error.localizedDescription)")
    case .finished:
        print("Finished")
    }
} receiveValue: { user in
    print("User: \(user)")
}*/


enum RegisterFormError: String, Error {
    case userExists = "User already exists"
    case wrongEmail = "Wrong Email"
    case wrongPassword = "Wrong Password"
    case unknown = "unknown"
}

let failPublisher = Fail<Any, RegisterFormError>(error: RegisterFormError.wrongPassword)

/*failPublisher.sink { completion in
    switch completion {
    case .failure(let error):
        print("Error \(error.localizedDescription)")
    case .finished:
        print("Finished")
    }
} receiveValue: { user in
    print("User: \(user)")
}*/



func register(user: User) -> AnyPublisher<User, RegisterFormError> {
    if user.email == "swiftui@gmail.com" {
        return Just(user)
            .setFailureType(to: RegisterFormError.self)
            .eraseToAnyPublisher()
    } else {
        return Fail(error: RegisterFormError.wrongEmail)
            .eraseToAnyPublisher()
    }
}

let cancellable = register(user: user)
    .sink { completion in
        switch completion {
        case .failure(let error):
            print("Error \(error.localizedDescription)")
        case .finished:
            print("Finished")
        }
    } receiveValue: { user in
        print("User: \(user)")
    }




















//: [Next](@next)
