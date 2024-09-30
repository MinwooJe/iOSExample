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
        guard let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: currentDateTime) else { return }
        
        currentDateTime = yesterday
        updateDateTime()
    }
    
    @IBAction func onNow() {
        fetchNow()
    }
    
    @IBAction func onTomorrow() {
        guard let tomorrow = Calendar.current.date(byAdding: .day, value: 1, to: currentDateTime) else { return }
        currentDateTime = tomorrow
        updateDateTime()
    }
    
    // MARK: - Controller
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    var currentDateTime = Date()
    
    private func fetchNow() {
        let url = "https://worldtimeapi.org/api/Asia/Seoul"
        
        datetimeLabel.text = "Loading.."
        
        URLSession.shared.dataTask(with: URL(string: url)!) { [weak self] data, _, _ in
            guard let data = data else { return }
            guard let model = try? JSONDecoder().decode(UTCTimeModel.self, from: data) else { return }
            
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSXXXXX"
            
            guard let now = formatter.date(from: model.currentDateTime) else { return }
            
            self?.currentDateTime = now
            
            DispatchQueue.main.async {
                self?.updateDateTime()
            }
        }.resume()
    }
    
    private func updateDateTime() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy년 MM월 dd일 HH시 mm분"
        datetimeLabel.text = formatter.string(from: currentDateTime)
    }

    // MARK: - Model
    struct UTCTimeModel: Codable {
        let utcOffset: String
        let timeZone: String
        let dayOfWeek: Int
        let dayOfYear: Int
        let currentDateTime: String
        let utcDateTime: String
        let unixTime: Int
        let rawOffset: Int
        let weekNumber: Int
        let dst: Bool
        let abbreviation: String
        let dstOffset: Int
        let dstFrom: String?
        let dstUntil: String?
        let clientIP: String
        
        enum CodingKeys: String, CodingKey {
            case utcOffset = "utc_offset"
            case timeZone = "timezone"
            case dayOfWeek = "day_of_week"
            case dayOfYear = "day_of_year"  
            case currentDateTime = "datetime"
            case utcDateTime = "utc_datetime"
            case unixTime = "unixtime"
            case rawOffset = "raw_offset"
            case weekNumber = "week_number"
            case dst
            case abbreviation
            case dstOffset = "dst_offset"
            case dstFrom = "dst_from"
            case dstUntil = "dst_until"
            case clientIP = "client_ip"
        }
    }
}

