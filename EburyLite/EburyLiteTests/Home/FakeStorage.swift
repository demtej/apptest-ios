//
//  FakeStorage.swift
//  EburyLiteTests
//
//  Created by Demian Tejo on 08/03/2023.
//

import Foundation

class FakeStorage : WalletDataStorage {
    private var wallets:[Wallet]

    init(wallets:[Wallet] = []){
        self.wallets = wallets
    }

    func getWallets() -> [Wallet] {
        wallets
    }

    func saveWallets(_ wallets: [Wallet]) {
        self.wallets = wallets
    }

    static var noWalletsFetcher: FakeStorage {
        return FakeStorage()
    }

    static var oneWalletsFetcher: FakeStorage {
        return FakeStorage(wallets: [Wallet.dummyWallet])
    }

    static var threeWalletsFetcher: FakeStorage {
        return FakeStorage(wallets: Wallet.dummyWallets(count: 3))
    }

    static var tenWalletsFetcher: FakeStorage {
        return FakeStorage(wallets: Wallet.dummyWallets(count: 10))
    }
}
