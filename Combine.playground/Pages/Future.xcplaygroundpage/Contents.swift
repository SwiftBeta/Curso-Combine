//: [Previous](@previous)

import Foundation
import Combine

func createUser() -> Future<String, Never> {
    return Future { promise in
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            promise(.success("Suscríbete a SwiftBeta 🚀"))
        }
    }
}

/*let cancellable = createUser()
    .sink { value in
        print("Value received: \(value)")
    }*/


struct ResourcesDataModel: Decodable {
    let characters: String
    let locations: String
    let episodes: String
}

/*func getResources(completionBlock: @escaping  (ResourcesDataModel) -> ()){
    let url = URL(string: "https://rickandmortyapi.com/api")!
    let urlRequest = URLRequest(url: url)
    URLSession.shared.dataTask(with: urlRequest) { data, response, error in
        guard let data else { return }
        let dataModel = try! JSONDecoder().decode(ResourcesDataModel.self, from: data)
        completionBlock(dataModel)
    }.resume()
}

getResources { dataModel in
    print("Resultado \(dataModel.characters)")
}*/


func getResourcesPromise() -> Future<ResourcesDataModel, Never> {
    return Future { promise in
        let url = URL(string: "https://rickandmortyapi.com/api")!
        let urlRequest = URLRequest(url: url)
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let data else { return }
            let dataModel = try! JSONDecoder().decode(ResourcesDataModel.self, from: data)
            promise(.success(dataModel))
        }.resume()
    }
}

let cancellable = getResourcesPromise()
    .sink { value in
        print("Value: \(value)")
    }


//: [Next](@next)
