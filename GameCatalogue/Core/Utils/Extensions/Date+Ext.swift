//
//  Date+Ext.swift
//  GameCatalogue
//
//  Created by Ahmad Zaky on 06/03/21.
//

import Foundation
extension Date {
    func toString(format: String = "dd MMMM yyyy") -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}
