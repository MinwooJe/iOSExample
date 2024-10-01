//
//  Entity.swift
//  MVVMTutorial
//
//  Created by 제민우 on 10/1/24.
//

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
