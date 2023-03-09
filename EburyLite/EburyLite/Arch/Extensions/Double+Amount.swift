//
//  Double+Amount.swift
//  EburyLite
//
//  Created by Demian Tejo on 08/03/2023.
//

import Foundation

extension Double {
    func formattedAmount() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter.string(from: NSNumber(value: self)) ?? ""
    }
}
