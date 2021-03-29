//
//  WebService.swift
//  MiniProjet
//
//  Created by Karim BEN-HAMMOUDA on 27/03/2021.
//

import UIKit

class WebService: NSObject {

    static let sharedInstance = WebService()
    typealias completionHandlerListArticle = (_ listArticle:[Article]) -> Void
    typealias completionHandlerListCategories = (_ listArticle:[Categorie]) -> Void
    
    func getListArticle(completionHandler:@escaping  completionHandlerListArticle)  {
        var listArticle = [Article]()
        GetApiRequest(Route.sharedInstance.ArticleListUrl()) { (finished, response) in
            if(finished)
            {
                do {
                    if let response = response as? Data {
                        let decoder = JSONDecoder()
                        listArticle = try decoder.decode([Article].self, from: response)
                        completionHandler(listArticle)
                    }
                } catch {
                    print(String.init(format: ApiLog.jsonErrorDeserializing,"\(error.localizedDescription)"))
                }
            }
            else {
                completionHandler([])
            }
        }
    }
    
    func getListCategories(completionHandler:@escaping  completionHandlerListCategories)  {
        var listCategorie = [Categorie]()
        GetApiRequest(Route.sharedInstance.CategorieListUrl()) { (finished, response) in
            if(finished)
            {
                do {
                    if let response = response as? Data {
                        let decoder = JSONDecoder()
                        listCategorie = try decoder.decode([Categorie].self, from: response)
                        completionHandler(listCategorie)
                    }
                } catch {
                    print(String.init(format: ApiLog.jsonErrorDeserializing,"\(error.localizedDescription)"))
                }
            }
            else {
                completionHandler([])
            }
        }
    }

}
