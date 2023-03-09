//
//  WalletCellData.swift
//  EburyLite
//
//  Created by Demian Tejo on 07/03/2023.
//

import Foundation

// Wallet cell data adapter
struct WalletCellData : CellRepresentable, Identifiable {
    var id : String { wallet.id }
    let wallet: Wallet
    var title: String { wallet.amount.currency }
    var subtitle: String { wallet.amount.description }
    var value: String { wallet.amount.amount.formattedAmount() }
    var imageName: String { "\(wallet.amount.currency)_Flag" }
}
