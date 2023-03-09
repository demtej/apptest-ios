//
//  HomeViewModelTest.swift
//  EburyLiteTests
//
//  Created by Demian Tejo on 08/03/2023.
//

import XCTest

final class HomeViewModelTest: XCTestCase {

    let listener = DummyListener()
    let expectationTimeOut = TimeInterval(10)

    //# MARK: Items to show tests
    func test_items_to_show_for_3_items_server_no_storage_list_collapsed() async {
        let dummyDS = WalletDataSourceImplementation(dataSource: FakeFetcher.threeWalletsFetcher, localStorage: FakeStorage.noWalletsFetcher)
        let sut = HomeViewModel(dataSource: dummyDS , listener: listener)
        XCTAssertEqual(sut.itemsToShow.count, 0)

        let expectation = expectation(description: "test_items_to_show_for_3_items_server_no_storage_list_collapsed")
        await sut.refreshData()
        expectation.fulfill()
        await waitForExpectations(timeout: expectationTimeOut)
        XCTAssertEqual(sut.itemsToShow.count, 3)
    }

    func test_items_to_show_for_10_items_server_no_storage_list_collapsed() async {
        let dummyDS = WalletDataSourceImplementation(dataSource: FakeFetcher.tenWalletsFetcher, localStorage: FakeStorage.noWalletsFetcher)
        let sut = HomeViewModel(dataSource: dummyDS , listener: listener)
        XCTAssertEqual(sut.itemsToShow.count, 0)

        let expectation = expectation(description: "test_items_to_show_for_10_items_server_no_storage_list_collapsed")
        await sut.refreshData()
        expectation.fulfill()

        await waitForExpectations(timeout: expectationTimeOut)
        XCTAssertEqual(sut.itemsToShow.count, 3)
    }

    func test_items_to_show_for_0_items_server_no_storage_list_collapsed() async {
        let dummyDS = WalletDataSourceImplementation(dataSource: FakeFetcher.noWalletsFetcher, localStorage: FakeStorage.noWalletsFetcher)
        let sut = HomeViewModel(dataSource: dummyDS , listener: listener)
        XCTAssertEqual(sut.itemsToShow.count, 0)

        let expectation = expectation(description: "test_items_to_show_for_0_items_server_no_storage_list_collapsed")
        await sut.refreshData()
        expectation.fulfill()
        await waitForExpectations(timeout: expectationTimeOut)
        XCTAssertEqual(sut.itemsToShow.count, 0)
    }

    func test_items_to_show_for_10_items_server_3_storage_list_collapsed() async {
        let dummyDS = WalletDataSourceImplementation(dataSource: FakeFetcher.threeWalletsFetcher, localStorage: FakeStorage.threeWalletsFetcher)
        let sut = HomeViewModel(dataSource: dummyDS , listener: listener)
        XCTAssertEqual(sut.itemsToShow.count, 3)

        let expectation = expectation(description: "test_items_to_show_for_10_items_server_3_storage_list_collapsed")
        await sut.refreshData()
        expectation.fulfill()

        await waitForExpectations(timeout: expectationTimeOut)
        XCTAssertEqual(sut.itemsToShow.count, 3)
    }

    func test_items_to_show_for_3_items_server_no_storage_list_expanded() async {
        let dummyDS = WalletDataSourceImplementation(dataSource: FakeFetcher.threeWalletsFetcher, localStorage: FakeStorage.noWalletsFetcher)
        let sut = HomeViewModel(dataSource: dummyDS , listener: listener)
        XCTAssertEqual(sut.itemsToShow.count, 0)

        let expectation = expectation(description: "test_items_to_show_for_3_items_server_no_storage_list_expanded")
        await sut.refreshData()
        expectation.fulfill()

        await waitForExpectations(timeout: expectationTimeOut)
        sut.tapViewMoreViewLessButton()
        XCTAssertEqual(sut.itemsToShow.count, 3)
    }

    func test_items_to_show_for_10_items_server_no_storage_list_expanded() async {
        let dummyDS = WalletDataSourceImplementation(dataSource: FakeFetcher.tenWalletsFetcher, localStorage: FakeStorage.noWalletsFetcher)
        let sut = HomeViewModel(dataSource: dummyDS , listener: listener)
        XCTAssertEqual(sut.itemsToShow.count, 0)

        let expectation = expectation(description: "test_items_to_show_for_10_items_server_no_storage_list_expanded")
        await sut.refreshData()
        expectation.fulfill()


        await waitForExpectations(timeout: expectationTimeOut)
        sut.tapViewMoreViewLessButton()
        XCTAssertEqual(sut.itemsToShow.count, 10)
    }

    func test_items_to_show_for_10_items_server_10_storage_list_expanded() async {
        let dummyDS = WalletDataSourceImplementation(dataSource: FakeFetcher.tenWalletsFetcher, localStorage: FakeStorage.tenWalletsFetcher)
        let sut = HomeViewModel(dataSource: dummyDS , listener: listener)
        XCTAssertEqual(sut.itemsToShow.count, 3)
        sut.tapViewMoreViewLessButton()
        XCTAssertEqual(sut.itemsToShow.count, 10)
        let expectation = expectation(description: "test_items_to_show_for_10_items_server_10_storage_list_expanded")
        await sut.refreshData()
        expectation.fulfill()

        await waitForExpectations(timeout: expectationTimeOut)
        XCTAssertEqual(sut.itemsToShow.count, 10)
    }

    //# MARK: List view size

    func test_list_height_for_screen_height_600_list_collapsed_is_600() {
        let size = ScreenSize(height: 600).size
        let sut = HomeViewModel(screenSize: size,dataSource: defaultDataSourceImplementation() , listener: listener)
        XCTAssertEqual(sut.listViewSize, 400)
    }

    func test_list_height_for_screen_height_2000_list_collapsed_is_1500() {
        let size = ScreenSize(height: 2000).size
        let sut = HomeViewModel(screenSize: size,dataSource: defaultDataSourceImplementation() , listener: listener)
        XCTAssertEqual(sut.listViewSize, 1000)
    }

    func test_list_height_for_screen_height_900_list_collapsed_is_600() {
        let size = ScreenSize(height: 600).size
        let sut = HomeViewModel(screenSize: size,dataSource: defaultDataSourceImplementation() , listener: listener)
        XCTAssertEqual(sut.listViewSize, 400)
    }

    func test_list_height_for_screen_height_600_list_expanded_is_600() {
        let size = ScreenSize(height: 600).size
        let sut = HomeViewModel(screenSize: size,dataSource: defaultDataSourceImplementation() , listener: listener)
        sut.tapViewMoreViewLessButton()
        XCTAssertEqual(sut.listViewSize, 450)
    }

    func test_list_height_for_screen_height_2000_list_expanded_is_1500() {
        let size = ScreenSize(height: 2000).size
        let sut = HomeViewModel(screenSize: size,dataSource: defaultDataSourceImplementation() , listener: listener)
        sut.tapViewMoreViewLessButton()
        XCTAssertEqual(sut.listViewSize, 1500)
    }

    func test_list_height_for_screen_height_900_list_expanded_is_600() {
        let size = ScreenSize(height: 900).size
        let sut = HomeViewModel(screenSize: size,dataSource: defaultDataSourceImplementation() , listener: listener)
        sut.tapViewMoreViewLessButton()
        XCTAssertEqual(sut.listViewSize, 675)
    }

    //# MARK: List Action Button Title

    func test_list_action_title_collapsed_list() {
        let sut = HomeViewModel(dataSource: defaultDataSourceImplementation() , listener: listener)
        XCTAssertEqual(sut.listActionButtonTitle, HomeViewModel.Texts.viewAll)
    }

    func test_list_action_title_expanded_list() {
        let sut = HomeViewModel(dataSource: defaultDataSourceImplementation() , listener: listener)
        sut.tapViewMoreViewLessButton()
        XCTAssertEqual(sut.listActionButtonTitle, HomeViewModel.Texts.showLess)
    }

    func defaultDataSourceImplementation() -> WalletDataSourceImplementation {
        WalletDataSourceImplementation(dataSource: FakeFetcher.noWalletsFetcher, localStorage: FakeStorage.noWalletsFetcher)
    }
}
