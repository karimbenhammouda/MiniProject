//
//  Article.swift
//  MiniProjet
//
//  Created by Karim BEN-HAMMOUDA on 27/03/2021.
//

import Foundation

struct Article: Decodable {
    let id: Int?
    let category_id: Int?
    let title: String?
    let description: String?
    let price: Float?
    let images_url: Image?
    let creation_date: String?
    let is_urgent: Bool?
}
