//
//  DetailArticleViewModel.swift
//  MiniProjet
//
//  Created by Karim BEN-HAMMOUDA on 27/03/2021.
//

import UIKit

class DetailArticleViewModel: NSObject {
    var article: Article?
    var nameCategorie: String?
    
    init(_ article: Article?, _ nameCategorie: String?) {
        self.article = article
        self.nameCategorie = nameCategorie
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
    
    func getCreationDate() -> String {
        return DateManager.shared.formatDate(dateStr: article?.creation_date) ?? ""
    }
    
    func getDescription() -> String {
        return article?.description ?? ""
    }
    
    func getText(_ text: String, _ font: UIFont) -> NSAttributedString {
        let attributedString = NSMutableAttributedString()
        attributedString.append(NSAttributedString(string: text,
                                                   attributes: [
                                                       NSAttributedString.Key.font: font,
                                                   ]))
        return attributedString
    }
    
    func getHeight(_ text: String, _ font: UIFont, width: CGFloat) -> CGFloat {
        return getText(text, font).calculateHeight(width: width)
    }
    
    func getAvailableWidth() -> CGFloat {
        Constants.contentSize.screenWidth - (Constants.contentSize.detailArticleLeadingMargin * 2)
    }
    
    func getDescriptionAvailableWidth() -> CGFloat {
        getAvailableWidth() - (Constants.contentSize.descriptionLabelDefeaulLeadingMargin * 2)
    }
}

