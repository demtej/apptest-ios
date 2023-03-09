//
//  ThemeTests.swift
//  EburyLiteTests
//
//  Created by Demian Tejo on 08/03/2023.
//

import XCTest

final class ThemeTests: XCTestCase {


    func test_formattedAmount_without_decimals() throws {
        let amount: Double = 2
        XCTAssertEqual(amount.formattedAmount(), "2.00")
    }

    func test_formattedAmount_with_one_decimal() throws {
        let amount: Double = 3.1
        XCTAssertEqual(amount.formattedAmount(), "3.10")
    }

    func test_formattedAmount_with_two_decimals() throws {
        let amount: Double = 3.16
        XCTAssertEqual(amount.formattedAmount(), "3.16")
    }

    func test_formattedAmount_with_three_decimals() throws {
        let amount: Double = 3.193
        XCTAssertEqual(amount.formattedAmount(), "3.19")
    }

}
