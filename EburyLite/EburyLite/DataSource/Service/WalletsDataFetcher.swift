//
//  WalletsDataFetcher.swift
//  EburyLite
//
//  Created by Demian Tejo on 08/03/2023.
//

import Foundation

protocol WalletsDataFetcher {
    func getWallets() async throws -> [Wallet]
}
