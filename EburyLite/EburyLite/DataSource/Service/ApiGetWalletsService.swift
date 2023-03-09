//
//  ApiGetWalletsService.swift
//  EburyLite
//
//  Created by Demian Tejo on 07/03/2023.
//

import Foundation


final class ApiGetWalletsService : WalletsDataFetcher {

    /// I fake the delay because I didn't do the server.
    private let DELAY : UInt32 = 3
    private let URL_STRING = "https://api.npoint.io/6bd48f0b414e397bec1d"

    enum APIError: Error { /// More errors will be created for Error Handling
        case malformedUrl
    }

    class WalletsResponse : Codable {
        var wallets: [Wallet]
    }

    func getWallets() async throws -> [Wallet] {
        guard let url = URL(string:URL_STRING) else {
            throw APIError.malformedUrl
        }
        sleep(DELAY)
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(WalletsResponse.self, from: data)
        return response.wallets
    }


}
