//
//  ViewModelType.swift
//  Combine_MVVM_Practice
//
//  Created by 제민우 on 4/30/25.
//

protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input) -> Output
}
