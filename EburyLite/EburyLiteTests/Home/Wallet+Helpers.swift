//
//  Wallet+Helpers.swift
//  EburyLiteTests
//
//  Created by Demian Tejo on 08/03/2023.
//

import Foundation

extension Wallet {
    static var dummyWallet : Wallet {
        Wallet(accountId: "", companyName: "", amount: Amount(amount: 0, currency: "", description: ""), creditDebitIndicator: "")
    }
    static func dummyWallets(count: Int) -> [Wallet] {
        Array(repeating: dummyWallet, count: count)
    }
}
