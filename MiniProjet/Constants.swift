//
//  Constants.swift
//  MiniProjet
//
//  Created by Karim BEN-HAMMOUDA on 27/03/2021.
//

import UIKit

struct Constants {
    static let baseURL = "https://raw.githubusercontent.com/leboncoin/paperclip/master/"
    
    struct contentSize {
        static let screenWidth: CGFloat = UIScreen.main.bounds.width
        //HomeViewContrller
        static let logoViewHeight: CGFloat = 100.0
        static let allCategoriesViewHeight: CGFloat = 50.0
        static let articleViewHeight: CGFloat = 150.0
        static let articleLeadingMargin: CGFloat = 20.0
        static let articleTrailingMargin: CGFloat = -20.0
        static let articleTopMargin: CGFloat = 10.0
        static let articleBottomMargin: CGFloat = -10.0
        static let photoArticleWidth: CGFloat = screenWidth *  0.35
        static let isUrgentHeight: CGFloat = 25.0
        static let isUrgentWidth: CGFloat = 50.0
        static let homeTitleArticleMargin: CGFloat = 10.0
        static let homePriceArticleMargin: CGFloat = -10.0
        static let homeCategorieArticleTopMargin: CGFloat = 5.0
        static let detailsPhotoImageViewHeight: CGFloat = 200.0
        static let detailArticleLeadingMargin: CGFloat = 20.0
        static let detailArticleTrailingMargin: CGFloat = -20.0
        static let detailArticleTitleTopMargin: CGFloat = 20.0
        static let articleScrollView: CGFloat = (screenWidth *  0.35) + 250.0
        static let categorieButtonWidth: CGFloat = 100.0
        static let UIPickerDefeaultHeight: CGFloat = 250.0
        static let UIToolbarDefeaultHeight: CGFloat = 40.0
        static let descriptionLabelDefeaulTopMargin: CGFloat = 5.0
        static let descriptionLabelDefeaulLeadingMargin: CGFloat = 5.0
    }
    
    struct contentColor {
        //HomeViewContrller
        static let homeViewColor: UIColor = .white
        static let detailsviewColor: UIColor = .white
        static let articleBackgroundColor: UIColor = UIColor(red: 220.0/255.0, green: 220.0/255.0, blue: 220.0/255.0, alpha: 0.6)
        static let articleCategorieTextColor: UIColor = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 0.8)
        static let datailArticleBackgroundColor: UIColor = UIColor(red: 220.00/255.0, green:220.0/255.0, blue: 220.0/255.0, alpha: 0.5)
    }
    
    struct cellIdendifier {
        //HomeViewContrller
        static let allCategoriesTableViewCell: String = "AllCategoriesTableViewCell"
        static let articleTableViewCell: String = "ArticleTableViewCell"
    }
    
    struct radius {
        //HomeViewContrller
        static let articleContentView: CGFloat = 10.0
    }
    
    struct priceDevice {
        //HomeViewContrller
        static let euro: String = "€"
    }
}
