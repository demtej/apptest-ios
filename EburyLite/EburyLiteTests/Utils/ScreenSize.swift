//
//  ScreenSize.swift
//  EburyLite
//
//  Created by Demian Tejo on 08/03/2023.
//

import Foundation

struct ScreenSize {
    let size: CGSize
    init(width: Double = 0, height: Double = 0) {
        self.size = CGSize(width: width, height: height)
    }
}
