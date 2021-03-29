//
//  Route.swift
//  MiniProjet
//
//  Created by Karim BEN-HAMMOUDA on 27/03/2021.
//

import UIKit

class Route: NSObject {
    static let sharedInstance = Route()
    
    public func ArticleListUrl() -> String { return String.init(format: "%@listing.json",Constants.baseURL) }
    public func CategorieListUrl() -> String { return String.init(format: "%@categories.json",Constants.baseURL) }
}
