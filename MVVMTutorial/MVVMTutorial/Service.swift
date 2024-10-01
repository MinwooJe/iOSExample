//
//  Service.swift
//  MVVMTutorial
//
//  Created by 제민우 on 10/1/24.
//

import Foundation

class Service {
    let repository = Repository()
    var model = Model(currentDateTime: Date())      // state
    
    func fetchNow(onCompleted: @escaping (Model) -> Void) {
        repository.fetchNow { entity in
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSXXXXX"
            
            guard let now = formatter.date(from: entity.currentDateTime) else { return }
            
            let model = Model(currentDateTime: now)
            self.model = model
            
            onCompleted(model)
        }
    }
    
    func changeDate(byDays: Int) {
        guard let newDay = Calendar.current.date(
            byAdding: .day,
            value: byDays,
            to: model.currentDateTime
        ) else { return }
        
        model.currentDateTime = newDay
    }
}
