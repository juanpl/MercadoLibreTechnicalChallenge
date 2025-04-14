//
//  Product.swift
//  MercadoLibreTechnicalChallenge
//
//  Created by Juan Pablo Lasprilla Correa on 5/04/25.
//

import Foundation

struct Product: Equatable {
    let id: String
    let title: String
    let description: String
    let productFeatures: [String]
    let productAttributes: [String : String]
    let images: [String]
    let price: Double?

    init(id: String,
         title: String,
         description: String,
         productFeatures: [String],
         productAttributes: [String : String],
         images: [String],
         price: Double?) {
        self.id = id
        self.title = title
        self.description = description
        self.productFeatures = productFeatures
        self.productAttributes = productAttributes
        self.images = images
        self.price = price
    }
}
