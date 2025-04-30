//
//  NetworkManagerType.swift
//  Combine_MVVM_Practice
//
//  Created by 제민우 on 4/30/25.
//

import Combine

protocol NetworkManagerType {
    func getRandomQuote() -> AnyPublisher<Quote, Error>
}
