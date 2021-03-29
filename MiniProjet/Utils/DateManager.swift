//
//  DateManager.swift
//  MiniProjet
//
//  Created by Karim BEN-HAMMOUDA on 27/03/2021.
//

import Foundation

class DateManager: NSObject {
    static let shared = DateManager()
    
    func formatDate(dateStr: String?) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        guard let dateStr = dateStr else {
            return nil
        }
        let date = dateFormatter.date(from: dateStr)
        let dateFormatterString = DateFormatter()
        dateFormatterString.dateFormat = "dd MMMM y à HH:mm"
        guard let currentDate = date else {
            return nil
        }
        return dateFormatterString.string(from: currentDate)
    }
    
    func convertDate(dateStr: String?) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        guard let dateStr = dateStr else {
            return nil
        }
        return dateFormatter.date(from: dateStr)
    }
    
    func sortedDate(dateStr: String?) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        guard let dateStr = dateStr else {
            return nil
        }
        let date = dateFormatter.date(from: dateStr)
        let dateFormatterString = DateFormatter()
        dateFormatterString.dateFormat = "yyyy-MM-dd"
        guard let currentDate = date else {
            return nil
        }
        return dateFormatterString.string(from: currentDate)
    }
}
