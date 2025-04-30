//
//  NetworkManager.swift
//  Combine_MVVM_Practice
//
//  Created by 제민우 on 4/30/25.
//

import Combine
import Foundation

class NetworkManager: NetworkManagerType {
    func getRandomQuote() -> AnyPublisher<Quote, Error> {
        let url = URL(string: "https://api.quotable.io/random")!
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .catch { error in
                return Fail(error: error)
                    .eraseToAnyPublisher()
            }
            .map { $0.data }
            .decode(type: Quote.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
