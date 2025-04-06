//
//  Product.swift
//  MercadoLibreTechnicalChallenge
//
//  Created by Juan Pablo Lasprilla Correa on 5/04/25.
//

import Foundation

struct Product: Identifiable, Hashable {
    let id: String
    let title: String
    let price: Double
    let description: String
    let ratingAverage: Double
    let productFeatures: [String : String]
    
}
