//
//  CategorieTests.swift
//  MiniProjetTests
//
//  Created by Karim BEN-HAMMOUDA on 27/03/2021.
//

import XCTest
@testable import MiniProjet

class CategorieTests: XCTestCase {
    func testCategorie() {
        let categorie = Categorie(id: 2, name: "Voiture")
        XCTAssertEqual(2, categorie.id)
        XCTAssertEqual("Voiture", categorie.name)
    }
}
