//
//  Wallet.swift
//  EburyLite
//
//  Created by Demian Tejo on 07/03/2023.
//

import Foundation


struct Wallet: Codable, Identifiable {
    
    var id: String { accountId }

    struct Amount: Codable {
        let amount: Double
        let currency: String
        let description: String

        private enum CodingKeys: String, CodingKey {
            case amount 
            case currency
            case description = "currency_description"
        }
    }
    let accountId: String
    let companyName: String
    let amount: Amount
    let creditDebitIndicator: String

     private enum CodingKeys: String, CodingKey {
        case accountId = "account_id"
        case companyName = "company_name"
        case amount = "amount"
        case creditDebitIndicator = "credit_debit_indicator"
    }
}
