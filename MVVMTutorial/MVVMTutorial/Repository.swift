//
//  Repository.swift
//  MVVMTutorial
//
//  Created by 제민우 on 10/1/24.
//

import Foundation

class Repository {
    func fetchNow(onCompleted: @escaping (UTCTimeModel) -> Void) {
        let url = "https://worldtimeapi.org/api/Asia/Seoul"
        
        URLSession.shared.dataTask(with: URL(string: url)!) { [weak self] data, _, _ in
            guard let data = data else { return }
            guard let model = try? JSONDecoder().decode(UTCTimeModel.self, from: data) else { return }
            
            onCompleted(model)
        }.resume()
    }
}
