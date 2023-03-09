//
//  Theme.swift
//  EburyLite
//
//  Created by Demian Tejo on 06/03/2023.
//

import UIKit
import SwiftUI

/// I didn't want to create many files to keep the project smallest as possible
/// The idea behind these extensions is to make the code more readable & to unify UI details such as colors, sizes, margins, etc..

extension UIColor {
    static let accentColor = UIColor(named: "AccentColor")
    static let backgroundColor = UIColor(named: "BackgroundColor")
    static let backgroundCellColor = UIColor(named: "BackgroundCellColor")
    fileprivate static let gradient1 = UIColor(named: "FirstColor")
    fileprivate static let gradient2 = UIColor(named: "SecondColor")
}

extension Color {
    /// Contextual colors
    static let iconColor = Color.accentColor.opacity(0.8)
    static let firstColorGradient = Color(UIColor.gradient1 ?? .green)
    static let secondColorGradient = Color(UIColor.gradient2 ?? .blue)
    static let backgroundColor = Color(UIColor.backgroundColor ?? .white)
    static let backgroundCellColor = Color(UIColor.backgroundCellColor ?? .white)
    static let blackShadow = Color.black.opacity(0.1)

}

extension Gradient {
    static let appGradient = Gradient(colors: [.firstColorGradient, .secondColorGradient])
}

extension CGFloat {
    /// Sizes and margins
    static let XXSMALL = 4.0
    static let XSMALL = 10.0
    static let SMALL = 16.0
    static let MEDIUM = 20.0
    static let LARGE = 30.0
    static let XLARGE = 40.0
    static let XXLARGE = 85.0

    /// Radius
    static let CONTAINER_RADIUS = 25.0
    static let SUBTLE_RADIUS = 8.0
}
