//
//  Array+RawRepresentable.swift
//  EburyLite
//
//  Created by Demian Tejo on 08/03/2023.
//

import Foundation

/// This is needed to use @AppStorage with [Wallet]
/// I'm not super fan of this kind of extension however as you see this simplify the code to much
/// In terms of development, if I wanted to improve the storage layer I'll create a Core Data implementation instead of using UserDefaults without this extension.

extension Array: RawRepresentable where Element: Codable {
    public init?(rawValue: String) {
        guard let data = rawValue.data(using: .utf8) else {
            return nil
        }
        do {
            let result = try JSONDecoder().decode([Element].self, from: data)
            self = result
        } catch {
            return nil
        }
    }

    public var rawValue: String {
        guard let data = try? JSONEncoder().encode(self),
              let result = String(data: data, encoding: .utf8)
        else {
            return "[]"
        }
        return result
    }
}
