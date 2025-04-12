//
//  Route.swift
//  MercadoLibreTechnicalChallenge
//
//  Created by Juan Pablo Lasprilla Correa on 11/04/25.
//

import Foundation


enum Routes: Hashable {
    case productList(searchText: String, countrySite: String)
    case productInfo(productId: String)
}
