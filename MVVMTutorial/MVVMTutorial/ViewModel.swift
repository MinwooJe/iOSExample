//
//  ViewModel.swift
//  MVVMTutorial
//
//  Created by 제민우 on 10/1/24.
//

import Foundation

class ViewModel {
    let service = Service()

    var onUpdated: () -> Void = {}
    
    var dateTimeString: String = "Loading..." {
        didSet {
            onUpdated()
        }
    }
    
    func reloadData() {
        service.fetchNow { [weak self] model in
            guard let self else { return }
            let dateString = self.dateToString(date: model.currentDateTime)
            self.dateTimeString = dateString
        }
    }
    
    func dateToString(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy년 MM월 dd일 HH시 mm분"
        return formatter.string(from: date)
    }
}
