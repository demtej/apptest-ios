//
//  WalletDataStorage.swift
//  EburyLite
//
//  Created by Demian Tejo on 08/03/2023.
//

import Foundation

protocol WalletDataStorage {
    func getWallets() -> [Wallet]
    func saveWallets(_ wallets: [Wallet])
}
