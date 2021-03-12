//
//  String+Ext.swift
//  GameCatalogue
//
//  Created by Ahmad Zaky on 12/03/21.
//

import Foundation

extension String {

    func toDate(withFormat format: String = "yyyy-MM-dd")-> Date?{

        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(identifier: "Asia/Jakarta")
        dateFormatter.locale = Locale(identifier: "id-ID")
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        dateFormatter.dateFormat = format
        let date = dateFormatter.date(from: self)

        return date
    }
}
   
