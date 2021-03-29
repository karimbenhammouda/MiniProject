//
//  WebServiceTests.swift
//  MiniProjetTests
//
//  Created by Karim BEN-HAMMOUDA on 28/03/2021.
//

import XCTest
@testable import MiniProjet

class WebServiceTests: XCTestCase {
    func testCallListsArticles() {
        let sut = URLSession(configuration: .default)
        let url = URL(string: Route.sharedInstance.ArticleListUrl())
        let promise = expectation(description: "Completion handler invoked")
        var statusCode: Int?
        var responseError: Error?
        let dataTask = sut.dataTask(with: url!) { data, response, error in
         statusCode = (response as? HTTPURLResponse)?.statusCode
         responseError = error
         promise.fulfill()
        }
        dataTask.resume()
        wait(for: [promise], timeout: 5)
      XCTAssertNil(responseError)
      XCTAssertEqual(statusCode, 200)
    }
    
    func testCallListsCategories() {
        let sut = URLSession(configuration: .default)
        let url = URL(string: Route.sharedInstance.CategorieListUrl())
        let promise = expectation(description: "Completion handler invoked")
        var statusCode: Int?
        var responseError: Error?
        let dataTask = sut.dataTask(with: url!) { data, response, error in
         statusCode = (response as? HTTPURLResponse)?.statusCode
         responseError = error
         promise.fulfill()
        }
        dataTask.resume()
        wait(for: [promise], timeout: 5)
        XCTAssertNil(responseError)
        XCTAssertEqual(statusCode, 200)
    }
}
