//
//  FakeFetcher.swift
//  EburyLite
//
//  Created by Demian Tejo on 08/03/2023.
//

import Foundation

class FakeFetcher : WalletsDataFetcher {
    private let wallets:[Wallet]
    func getWallets() async throws -> [Wallet] {
        wallets
    }

    init(wallets:[Wallet] = []){
        self.wallets = wallets
    }

    static var noWalletsFetcher: FakeFetcher {
        return FakeFetcher()
    }

    static var oneWalletsFetcher: FakeFetcher {
        return FakeFetcher(wallets: [Wallet.dummyWallet])
    }

    static var threeWalletsFetcher: FakeFetcher {
        return FakeFetcher(wallets: Wallet.dummyWallets(count: 3))
    }

    static var tenWalletsFetcher: FakeFetcher {
        return FakeFetcher(wallets: Wallet.dummyWallets(count: 10))
    }

}
