//
//  ProductViewModel.swift
//  EburyLite
//
//  Created by Demian Tejo on 07/03/2023.
//

import Foundation
import SwiftUI


class ProductViewModel {
    
    private let screenSize: CGSize

    init(screenSize: CGSize = UIScreen.main.bounds.size ) {
        self.screenSize = screenSize
    }

    // MARK: Image & Text Strings
    struct Texts {
        static let title = "Products"
        static let commingSoon = "Coming Soon"
        static let description =  "We are currently working in more features to offer the best experience"
    }

    struct ImageNames {
        static let commingSoon = "ComingSoon"
    }

    // MARK: Env Const

    private var THREE_QUARTERS_HEIGHT_SCREEN : CGFloat {
        screenSize.height * 0.75
    }

    // MARK: Const configurations

    private let MIN_CONTAINER_HEIGHT : CGFloat = 600

    //MARK: View Configurations

    var containerHeight : CGFloat {
        max(THREE_QUARTERS_HEIGHT_SCREEN, MIN_CONTAINER_HEIGHT)
    }
    
}
