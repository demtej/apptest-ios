//
//  ProductCoordinator.swift
//  EburyLite
//
//  Created by Demian Tejo on 06/03/2023.
//

import Foundation
import UIKit

final class ProductCoordinator: CoodinatorProtocol, TabBarItemRepresentable {

    var tabBarItem: UITabBarItem { UITabBarItem(title: "Products", image: UIImage(named: "StarIcon"), tag: 0) }

    func start() -> ViewControllableProtocol {
        let productScreen = ProductScreen(viewModel: ProductViewModel())
        return productScreen
    }

}
