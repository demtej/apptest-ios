//
//  HomeCoordinator.swift
//  EburyLite
//
//  Created by Demian Tejo on 06/03/2023.
//

import Foundation
import UIKit

protocol ShowUserConfigurations {
    func showUserConfigurations()
}

final class HomeCoordinator: CoodinatorProtocol, TabBarItemRepresentable {

    var tabBarItem: UITabBarItem { UITabBarItem(title: "Home", image: UIImage(named: "WalletIcon"), tag: 0) }

    private let delegate : ShowUserConfigurations
    private let dataSource: WalletDataSourceImplementation

    init(delegate: ShowUserConfigurations, dataSource: WalletDataSourceImplementation) {
        self.delegate = delegate
        self.dataSource = dataSource
    }

    func start() -> ViewControllableProtocol {
        let homeScreen = HomeScreen(viewModel: HomeViewModel(dataSource: self.dataSource, listener: self ))
        return homeScreen
    }

}


extension HomeCoordinator :  HomeScreenEventListener {
    func tapUserConfigurations() {
        delegate.showUserConfigurations()
    }
}
