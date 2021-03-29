//
//  ListsArticlesViewModelTests.swift
//  MiniProjetTests
//
//  Created by Karim BEN-HAMMOUDA on 28/03/2021.
//

import XCTest
@testable import MiniProjet

class ListsArticlesViewModelTests: XCTestCase {
    let viewModel = ListsArticlesViewModel()
    
    func testCountAllListCategorie() {
        viewModel.listCategorie = [Categorie(id: 2, name: "Voiture")]
        let newListCategoris = viewModel.getCountCategories()
        XCTAssertEqual(newListCategoris, viewModel.listCategorie.count + 1)
    }
    
    func testArraySortedData() {
        var listArticle = [Article]()
        let article1 = Article(id: 1, category_id: 3, title: "", description: "", price: nil, images_url: nil, creation_date: "2019-11-05T15:56:59+0000", is_urgent: true)
        let article2 = Article(id: 2, category_id: 3, title: "", description: "", price: nil, images_url: nil, creation_date: "2019-11-05T16:56:59+0000", is_urgent: true)
        let article3 = Article(id: 3, category_id: 3, title: "", description: "", price: nil, images_url: nil, creation_date: "2019-11-05T15:56:59+0000", is_urgent: false)
        let article4 = Article(id: 4, category_id: 3, title: "", description: "", price: nil, images_url: nil, creation_date: "2019-11-05T16:56:59+0000", is_urgent: false)
        let article5 = Article(id: 5, category_id: 3, title: "", description: "", price: nil, images_url: nil, creation_date: "2019-11-06T15:56:59+0000", is_urgent: true)
        let article6 = Article(id: 6, category_id: 3, title: "", description: "", price: nil, images_url: nil, creation_date: "2019-11-06T16:56:59+0000", is_urgent: true)
        let article7 = Article(id: 7, category_id: 3, title: "", description: "", price: nil, images_url: nil, creation_date: "2019-11-06T15:56:59+0000", is_urgent: false)
        let article8 = Article(id: 8, category_id: 3, title: "", description: "", price: nil, images_url: nil, creation_date: "2019-11-06T16:56:59+0000", is_urgent: false)
        listArticle.append(article1)
        listArticle.append(article2)
        listArticle.append(article3)
        listArticle.append(article4)
        listArticle.append(article5)
        listArticle.append(article6)
        listArticle.append(article7)
        listArticle.append(article8)
        
        let listesArticleSorted = viewModel.sortedData(listArticle)
        XCTAssertEqual(listArticle.count, listesArticleSorted.count)
    }
}
