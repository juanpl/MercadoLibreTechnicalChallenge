//
//  ProductListItem.swift
//  MercadoLibreTechnicalChallenge
//
//  Created by Juan Pablo Lasprilla Correa on 5/04/25.
//

import Foundation

struct ProductListItem: Identifiable, Hashable {
    let id: String
    let name: String
    let image: String
    
    init(id: String, name: String, image: String) {
        self.id = id
        self.name = name
        self.image = image
    }
}
