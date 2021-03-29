//
//  ListsArticlesViewModel.swift
//  MiniProjet
//
//  Created by Karim BEN-HAMMOUDA on 27/03/2021.
//

import UIKit

protocol ListsArticlesViewModelDelegate: NSObject {
    func getDataCompleted()
    func dataFiltered()
}

class ListsArticlesViewModel: NSObject {
    var listCategorie = [Categorie]()
    var listArticle = [Article]()
    var defaultListArticle = [Article]()
    var delegate: ListsArticlesViewModelDelegate?
    
    override init() {
        super.init()
    }
    
    func fetchListArticle() {
        WebService.sharedInstance.getListArticle(completionHandler: { ( listArticles ) in
            let listArticlesSorted = self.sortedData(listArticles)
            self.defaultListArticle = listArticlesSorted
            self.listArticle = listArticlesSorted
            self.delegate?.getDataCompleted()
        })
    }
    
    func fetchListCategories() {
        WebService.sharedInstance.getListCategories(completionHandler: { ( listCategories ) in
            self.listCategorie = listCategories
            self.delegate?.getDataCompleted()
        })
    }
    
    func getCountData() -> Int {
        return listArticle.count
    }
    
    func getCategoriesArticle(_ index: Int) -> String? {
        var namecategorie: String?
        for categorie in listCategorie {
            if categorie.id == listArticle[index].category_id {
                namecategorie = categorie.name
            }
        }
        return namecategorie
    }
    
    func getCountCategories() -> Int {
        return listCategorie.count + 1
    }
    
    func filteredArticle(_ id: Int?) {
        self.listArticle = self.defaultListArticle
        if id == nil {
            self.listArticle = self.defaultListArticle
        } else {
            self.listArticle = self.listArticle.filter { article in
              return article.category_id == id
            }
        }
        self.listArticle = sortedData(self.listArticle)
        delegate?.dataFiltered()
    }
    
    func sortedArrayWithDate(_ listArticles: [Article]) -> [Article] {
        let sorted = listArticles.sorted { (articleOne, articleTwo) -> Bool in
            if let creationDateStringArticleOne = articleOne.creation_date, let creationDateArticleOne = DateManager.shared.convertDate(dateStr: creationDateStringArticleOne), let creationDateStringArticleTwo = articleTwo.creation_date, let creationDateArticleTwo = DateManager.shared.convertDate(dateStr: creationDateStringArticleTwo) {
                return creationDateArticleOne.compare(creationDateArticleTwo) == .orderedDescending
            }
            return true
        }
        return sorted
    }
    
    func sortedData(_ listArticles: [Article]) -> [Article] {
        var array = [Article]()
        let listArticleIsUrgent = listArticles.filter { article in
            return article.is_urgent == true
        }
        let listArticleNoUrgent = listArticles.filter { article in
            return article.is_urgent == false
        }
        let listArticleIsUrgentSorted = self.sortedArrayWithDate(listArticleIsUrgent)
        let listArticleNoUrgentSorted = self.sortedArrayWithDate(listArticleNoUrgent)
        
        if listArticleIsUrgentSorted.count <= 1 {
            array = listArticleIsUrgentSorted
            array += listArticleNoUrgentSorted
        } else {
            array.append(listArticleIsUrgentSorted[0])
            for i in 1...listArticleIsUrgentSorted.count - 1 {
                if let dateOne = DateManager.shared.sortedDate(dateStr: array[array.count - 1].creation_date), let dateTwo = DateManager.shared.sortedDate(dateStr: listArticleIsUrgentSorted[i].creation_date ) {
                    if dateOne == dateTwo {
                        array.append(listArticleIsUrgentSorted[i])
                    } else {
                        for article in listArticleNoUrgentSorted {
                            if let dateThree = DateManager.shared.sortedDate(dateStr: array[array.count - 1].creation_date), let dateFor = DateManager.shared.sortedDate(dateStr: article.creation_date ) {
                                if dateThree == dateFor {
                                    array.append(article)
                                }
                            }
                        }
                        array.append(listArticleIsUrgentSorted[i])
                    }
                }
            }
            for article in listArticleNoUrgentSorted {
                if let id = article.id, !array.contains(where: {$0.id == id}) {
                    array.append(article)
                }
            }
        }
        return array
    }
}
