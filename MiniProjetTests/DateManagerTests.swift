//
//  DateManagerTests.swift
//  MiniProjetTests
//
//  Created by Karim BEN-HAMMOUDA on 27/03/2021.
//

import XCTest
@testable import MiniProjet

class DateManagerTests: XCTestCase {
    internal func formatDate() -> String {
        return "05 November 2019 à 16:56"
    }

    internal func convertDate() -> Date {
        return Date(timeIntervalSinceReferenceDate: 594662219.0)
    }

    internal func sortedDate() -> String {
        return "2019-11-05"
    }

    func testFormatDate() {
        let article = Article(id: 3123, category_id: 3, title: "title", description: "description", price: 12.0, images_url: nil, creation_date: "2019-11-05T15:56:59+0000", is_urgent: true)
        let date = DateManager.shared.formatDate(dateStr: article.creation_date)
        XCTAssertEqual(date, formatDate())
    }

    func testConvertDate() {
        let article = Article(id: 3123, category_id: 3, title: "title", description: "description", price: 12.0, images_url: nil, creation_date: "2019-11-05T15:56:59+0000", is_urgent: true)
        let date = DateManager.shared.convertDate(dateStr: article.creation_date)
        XCTAssertEqual(date, convertDate())
    }

    func testSortedDate() {
        let article = Article(id: 3123, category_id: 3, title: "title", description: "description", price: 12.0, images_url: nil, creation_date: "2019-11-05T15:56:59+0000", is_urgent: true)
        let date = DateManager.shared.sortedDate(dateStr: article.creation_date)
        XCTAssertEqual(date, sortedDate())
    }
}
