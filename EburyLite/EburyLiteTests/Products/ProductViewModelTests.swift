//
//  ProductViewModelTests.swift
//  EburyLiteTests
//
//  Created by Demian Tejo on 08/03/2023.
//

import XCTest

final class ProductViewModelTests: XCTestCase {


    //# MARK: Container size tests

    func test_container_height_for_screen_height_600_is_600() {
        let size = ScreenSize(height: 600).size
        let sut = ProductViewModel(screenSize: size)
        XCTAssertEqual(sut.containerHeight, 600)
    }

    func test_container_height_for_screen_height_2000_is_1500() {
        let size = ScreenSize(height: 2000).size
        let sut = ProductViewModel(screenSize: size)
        XCTAssertEqual(sut.containerHeight, 1500)
    }

    func test_container_height_for_screen_height_900_is_600() {
        let size = ScreenSize(height: 900).size
        let sut = ProductViewModel(screenSize: size)
        XCTAssertEqual(sut.containerHeight, 675)
    }

}
