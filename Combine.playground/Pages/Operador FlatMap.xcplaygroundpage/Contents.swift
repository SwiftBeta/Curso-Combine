//: [Previous](@previous)

import Foundation
import Combine

struct User {
    let email: String
    let name: String
}

let user: User = .init(email: "swiftbeta.blog@gmail.com",
                       name: "SwiftBeta")

enum RegisterFormError: String, Error {
    case userExists = "User already exists"
    case wrongEmail = "Wrong Email"
    case wrongPassword = "Wrong Password"
    case unknown = "Unknown Error"
}

func register(user: User) -> AnyPublisher<User, RegisterFormError> {
    if user.email == "swiftbeta.blog@gmail.com" {
        return Just(user)
            .setFailureType(to: RegisterFormError.self)
            .eraseToAnyPublisher()
    } else {
        return Fail(error: RegisterFormError.wrongEmail)
            .eraseToAnyPublisher()
    }
}

func save(user: User) -> AnyPublisher<Bool, RegisterFormError> {
    if user.name == "SwiftUI" {
        return Just(true)
            .setFailureType(to: RegisterFormError.self)
            .eraseToAnyPublisher()
    } else {
        return Fail(error: RegisterFormError.wrongEmail)
            .eraseToAnyPublisher()
    }
}



register(user: user)
    .flatMap { user in
        save(user: user)
    }
    .catch({ _ in
        Just(false)
    })
    .sink { completion in
        switch completion {
        case .failure(let error):
            print("Error \(error.localizedDescription)")
        case .finished:
            print("Finished")
        }
    } receiveValue: { value in
        print("Usuario registrado y almacenado en la base de datos. REGISTERED -> \(value)")
    }

















//: [Next](@next)
