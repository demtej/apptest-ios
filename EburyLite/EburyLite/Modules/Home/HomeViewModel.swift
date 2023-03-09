//
//  HomeViewModel.swift
//  EburyLite
//
//  Created by Demian Tejo on 07/03/2023.
//

import SwiftUI
import Combine

protocol HomeScreenEventListener {
    func tapUserConfigurations()
}

final class HomeViewModel: ObservableObject {

    private enum ListState {
        case expanded
        case collapsed
    }

    private enum DataState {
        case fetching
        case fetched
    }

    /// A better solution is to replace the var type from WalletDataSourceImplementation to WalletDataSource
    /// I decided to use a concrete implementation of WalletDataSource in order to avoid any work arround to access to @published [Wallets]
    private let dataSource: WalletDataSourceImplementation

    /// I use a property for testing purposes
    private let screenSize: CGSize

    private let listener: HomeScreenEventListener

    private var cancelableSuscription: Cancellable?

    init(screenSize: CGSize = UIScreen.main.bounds.size, dataSource: WalletDataSourceImplementation, listener: HomeScreenEventListener ) {
        self.screenSize = screenSize
        self.dataSource = dataSource
        self.listener = listener
        items = dataSource.wallets
        cancelableSuscription = dataSource.$wallets.sink { [weak self] value in
            DispatchQueue.main.async { self?.items = value }
        }
    }

    // MARK: Image & Text Strings
    struct Texts {
        static let viewAll = "View all"
        static let showLess = "Show less"
        static let welcome =  "Welcome"
        static let companyName =  "Company name"
        static let yourCurrencies = "Your currencies"
        static let fetchingData = "Retrieving your wallets"
        static let noWalletsToShow = "You don't have any wallet yet"
    }

    struct ImageNames {
        static let user = "person.circle"
        static let commingSoon = "ComingSoon"
    }

    // MARK: Published vars

    @Published private var items: [Wallet] = []
    @Published private var viewState: ListState = .collapsed
    @Published private var dataState: DataState = .fetching


    /// I use an adapter to hide the business object
    var itemsToShow: [WalletCellData] {
        switch viewState{
        case .collapsed:
            return shortListWallets.map{ WalletCellData(wallet: $0) }
        case .expanded:
            return fullListWallets.map{ WalletCellData(wallet: $0) }
        }
    }

    // MARK: Env Const
    /// The percents and const values were chosen arbitrarily after some visual testing
    private var HALF_HEIGHT_SCREEN : CGFloat {
        screenSize.height * 0.5
    }

    private var THREE_QUARTERS_HEIGHT_SCREEN : CGFloat  {
        screenSize.height *  0.75
    }

    // MARK: Const configurations

    private let MIN_LIST_HEIGHT : CGFloat = 400
    private let SHOWED_WALLETS_IN_COLLAPSED_STATE = 3

    private var smallHeight: CGFloat {
        max(HALF_HEIGHT_SCREEN, MIN_LIST_HEIGHT)
    }
    private var largeHeight: CGFloat {
        THREE_QUARTERS_HEIGHT_SCREEN
    }

    //MARK: View Configurations

    var listViewSize: CGFloat {
        /// A better solution is to use GeometricReader. Because of deadline & the fact that the app doesn't support landscape I use UIScreen
        isListCollapsed ? smallHeight : largeHeight
    }

    var listActionButtonTitle: String {
        isListCollapsed ? Texts.viewAll : Texts.showLess
    }

    var feedbackText: String {
        switch dataState {
        case .fetching:
            return Texts.fetchingData
        case .fetched:
            return Texts.noWalletsToShow
        }
    }

    //MARK: View Interaction Actions

    func tapViewMoreViewLessButton() {
        withAnimation(Animation.easeInOut) {
            viewState = viewState == .collapsed ? .expanded : .collapsed
        }
    }

    func pullDownToRefresh() async {
        await refreshData()
    }

    func tapUserIcon() {
        listener.tapUserConfigurations()
    }

    func refreshData() async {
        do {
            try await dataSource.refreshData()
            DispatchQueue.main.async{
                self.dataState = .fetched
            }
        } catch (let error) {
            /// Error handling was cut in order to fullfil with deadline
            /// Proposed solution:  Creating a new state "error" and show an appropriate message with a retry button
            print(error)
        }
    }


}


//MARK: Code reading helpers
/// I create some methods to ease the code reading.
/// I understand that this is a decision of the development team and may not be the most appropriate for many developers.
/// I prioritized reading over less code in this case
extension HomeViewModel {
    private var isListCollapsed : Bool {
        viewState == .collapsed
    }

    private var shortListWallets: [Wallet] {
        Array(items.prefix(SHOWED_WALLETS_IN_COLLAPSED_STATE))
    }

    private var fullListWallets: [Wallet] {
        items
    }
}
