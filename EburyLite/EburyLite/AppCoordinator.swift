//
//  AppCoordinator.swift
//  EburyLite
//
//  Created by Demian Tejo on 06/03/2023.
//

import UIKit
import Combine
import SwiftUI

final class AppCoordinator: ObservableObject {

    private let baseTabBar =  UITabBarController()

    func start() -> UIViewController {

        return AuthenticationScreen().viewController()
        let homeCoordinator = HomeCoordinator(delegate: self, dataSource: WalletDataSourceImplementation(dataSource: ApiGetWalletsService(), localStorage: UserDefaultsWalletStorage()))
        let productsCoorinator = ProductCoordinator()

        let homeScreen = homeCoordinator.start().viewController()
        homeScreen.tabBarItem =  homeCoordinator.tabBarItem

        let productScreen = productsCoorinator.start().viewController()
        productScreen.tabBarItem =  productsCoorinator.tabBarItem

        baseTabBar.tabBar.backgroundColor = UIColor.backgroundCellColor
        baseTabBar.viewControllers = [homeScreen, productScreen]

        return baseTabBar
    }
}

extension AppCoordinator : ShowUserConfigurations {
    func showUserConfigurations() {
        let userScreen = UserScreen(viewModel: UserViewModel())
        baseTabBar.present(userScreen.viewController(), animated: true, completion: nil)
    }
}
