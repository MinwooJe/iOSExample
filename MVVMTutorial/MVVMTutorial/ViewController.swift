//
//  ViewController.swift
//  MVVMTutorial
//
//  Created by 제민우 on 9/27/24.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - View
    @IBOutlet var datetimeLabel: UILabel!
    
    @IBAction func onYesterday() {
    }
    
    @IBAction func onNow() {
    }
    
    @IBAction func onTomorrow() {
    }
    
    // MARK: - Controller
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
//    var currentDateTime = Date()
    
//    private func fetchNow() {
//        let url = "https://worldtimeapi.org/api/Asia/Seoul"
//        
//        datetimeLabel.text = "Loading.."
//        
//        URLSession.shared.dataTask(with: URL(string: url)!) { [weak self] data, _, _ in
//            guard let data = data else { return }
//            guard let model = try? JSONDecoder().decode(UTCTimeModel.self, from: data) else { return }
//            
//            let formatter = DateFormatter()
//            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSXXXXX"
//            
//            guard let now = formatter.date(from: model.currentDateTime) else { return }
//            
//            self?.currentDateTime = now
//            
//            DispatchQueue.main.async {
//                self?.updateDateTime()
//            }
//        }.resume()
//    }
    
    private func updateDateTime() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy년 MM월 dd일 HH시 mm분"
//        datetimeLabel.text = formatter.string(from: currentDateTime)
    }

    // MARK: - Model

}

