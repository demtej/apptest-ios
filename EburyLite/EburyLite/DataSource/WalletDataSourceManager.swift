//
//  WalletDataSourceManager.swift
//  EburyLite
//
//  Created by Demian Tejo on 08/03/2023.
//

import Foundation


protocol WalletDataSource {
    func refreshData() async throws
    var wallets: [Wallet] { get }
}


/// The idea behind this object is to isolate the datasource and its impementation
/// With WalletDataSource we can use hardcoded data, an array as cache/storage or no request at all
/// This allow us to scale from UserDefauls (or even no cache) to CoreData

class WalletDataSourceImplementation: ObservableObject, WalletDataSource {

    private let dataSource : WalletsDataFetcher
    private let localStorage: WalletDataStorage

    @Published var wallets: [Wallet] = []

    init(dataSource: WalletsDataFetcher, localStorage: WalletDataStorage) {
        self.dataSource = dataSource
        self.localStorage = localStorage
        self.wallets = localStorage.getWallets()
    }


    func refreshData() async throws {
        let wallets = try await dataSource.getWallets()
        localStorage.saveWallets(wallets)
        self.wallets = wallets
    }
}
