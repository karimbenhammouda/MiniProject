//
//  ListsArticlesViewControllerTests.swift
//  MiniProjetTests
//
//  Created by Karim BEN-HAMMOUDA on 28/03/2021.
//

import XCTest
@testable import MiniProjet

class ListsArticlesViewControllerTests: XCTestCase {
    private var sut: ListsArticlesViewController!
    private var dataSource: TableViewDataSource!
    private var delegate: TableViewDelegate!
    
    override func setUp() {
        super.setUp()
        sut = ListsArticlesViewController(nil)
        sut.loadViewIfNeeded()
        sut.tableView.register(ArticleTableViewCell.self, forCellReuseIdentifier: Constants.cellIdendifier.articleTableViewCell)
        dataSource = TableViewDataSource()
        delegate = TableViewDelegate()
        sut.tableView.delegate = delegate
        sut.tableView.dataSource = dataSource
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testOutletsShouldBeConnected() {
        XCTAssertNotNil(sut.logoView)
        XCTAssertNotNil(sut.logoImageView)
        XCTAssertNotNil(sut.contentView)
        XCTAssertNotNil(sut.categorieView)
        XCTAssertNotNil(sut.categorieLabel)
        XCTAssertNotNil(sut.categorieButton)
        XCTAssertNotNil(sut.tableView)
        XCTAssertNotNil(sut.picker)
        XCTAssertNotNil(sut.toolBar)
    }
    
    func testTappingCategorieButton() {
        sut.categorieButton.sendActions(for: .touchUpInside)
    }
    
    func testCategorieLabel() {
        XCTAssertEqual(NSLocalizedString("select_Categories", comment: ""), sut.categorieLabel.text)
    }
    
    func testTableViewCell() {
        let indexPath = IndexPath(row: 0, section: 0)
        _ = createCell(indexPath: indexPath)
    }
}

extension ListsArticlesViewControllerTests {
    func createCell(indexPath: IndexPath) -> ArticleTableViewCell {
        let cell = dataSource.tableView(sut.tableView, cellForRowAt: indexPath) as! ArticleTableViewCell
        XCTAssertNotNil(cell)
        let view = cell.contentView
        XCTAssertNotNil(view)
        return cell
    }
}


private class TableViewDataSource: NSObject, UITableViewDataSource {
    var items = [Article]()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdendifier.articleTableViewCell, for: indexPath) as! ArticleTableViewCell
        return cell
    }
    
    override init() {
        super.init()
    }
}

private class TableViewDelegate: NSObject, UITableViewDelegate {}
