//
//  ViewControllable.swift
//  EburyLite
//
//  Created by Demian Tejo on 06/03/2023.
//

import SwiftUI
import UIKit

// MARK: ViewController
protocol ViewControllableProtocol {
    func viewController() -> UIViewController

}
extension ViewControllableProtocol where Self: View {
    func viewController() -> UIViewController {
        return UIHostingController(rootView: self)
    }
}
