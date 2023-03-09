//
//  UserDefaultsWalletStorage.swift
//  EburyLite
//
//  Created by Demian Tejo on 08/03/2023.
//

import Foundation
import SwiftUI

class UserDefaultsWalletStorage : WalletDataStorage {

    @AppStorage("wallets") private var wallets : [Wallet] = []

    func getWallets() -> [Wallet] {
            return wallets
    }

    /// This method just replaces all the old data with the new one.
    /// In terms of efficiency, I understand that could be better.
    /// That's a good reason to use CoreData for a real application.
    func saveWallets(_ wallets: [Wallet]) {
        self.wallets = wallets
    }


}
