//
//  ArticleCellViewModel.swift
//  MiniProjet
//
//  Created by Karim BEN-HAMMOUDA on 27/03/2021.
//

import UIKit

class ArticleCellViewModel: NSObject {
    var article: Article?
    var index: Int
    var nameCategorie: String?
    
    init(_ article: Article?, _ index: Int, _ namecategorie: String?) {
        self.article = article
        self.index = index
        self.nameCategorie = namecategorie
    }
    
    func getIsUrgentArticle() -> Bool {
        return article?.is_urgent ?? false
    }
    
    func getTitleArticle() -> String {
        return article?.title ?? ""
    }
    
    func getPriceArticle() -> String {
        if let price = article?.price {
            return String(format: "%@%@%@", "\(price)" , " " , Constants.priceDevice.euro)
        } else {
            return ""
        }
    }
    
    func getNameCategorie() -> String {
        return nameCategorie ?? ""
    }
}
