//: [Previous](@previous)

import Foundation
import Combine

struct DataModel: Decodable {
    let characters: String
    let locations: String
    let episodes: String
}

let url = URL(string: "https://rickandmortyapi.com/api")!
let cancellable = URLSession.shared.dataTaskPublisher(for: url)
    /*.tryMap { (data, response) -> Data in
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        return data
    }*/
    .map(\.data)
    .decode(type: DataModel.self, decoder: JSONDecoder())
    .sink { completion in
        switch completion {
        case .failure(let error):
            print("Error: \(error.localizedDescription)")
        case .finished:
            print("Finished")
        }
    } receiveValue: { value in
        print("Value: \(value)")
    }

//: [Next](@next)
