//
//  ProductListItemModel.swift
//  MercadoLibreTechnicalChallenge
//
//  Created by Juan Pablo Lasprilla Correa on 8/04/25.
//

import Foundation

struct ProductListItemModel: Codable {
    
    let results: [ResultsModel]
    
    enum CodingKeys: String, CodingKey {
        case results = "results"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        results = try container.decode([ResultsModel].self, forKey: .results)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(results, forKey: .results)
    }
    
    static func toEntity(_ productListItemModel: ProductListItemModel) -> [ProductListItem] {
        var productList: [ProductListItem] = []
        for item in productListItemModel.results {
            let product = ProductListItem(
                id: item.id,
                name: item.name,
                image: item.pictures[0].url
            )
            productList.append(product)
        }
        return productList
    }
    
}

struct ResultsModel: Codable {
    
    let id: String
    let name: String
    let pictures: [PictureModel]
    
}

struct PictureModel: Codable {
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case url
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.url = try container.decode(String.self, forKey: .url)
    }
    
    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(url, forKey: .url)
    }
}


