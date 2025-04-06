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
    let ratingAverage: Double
    let price: Double
    let image: String
    
    init(id: String,
         name: String,
         ratingAverage: Double,
         price: Double,
         image: String) {
        self.id = id
        self.name = name
        self.ratingAverage = ratingAverage
        self.price = price
        self.image = image
    }
}
