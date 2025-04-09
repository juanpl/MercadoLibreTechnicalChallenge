//
//  ProductModel.swift
//  MercadoLibreTechnicalChallenge
//
//  Created by Juan Pablo Lasprilla Correa on 8/04/25.
//

import Foundation

struct ProductModel: Codable {
    let id: String
    let name: String
    let pictures: [Picture]
    let mainFeatures: [MainFeature]
    let attributes: [AttributeModel]
    let shortDescription: ShortDescription
    let buyBoxWinner: BuyBoxWinner?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case pictures
        case mainFeatures = "main_features"
        case attributes
        case shortDescription = "short_description"
        case buyBoxWinner = "buy_box_winner"
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.pictures = try container.decode([Picture].self, forKey: .pictures)
        self.mainFeatures = try container.decode([MainFeature].self, forKey: .mainFeatures)
        self.attributes = try container.decode([AttributeModel].self, forKey: .attributes)
        self.shortDescription = try container.decode(ShortDescription.self, forKey: .shortDescription)
        self.buyBoxWinner = try container.decode(BuyBoxWinner.self, forKey: .buyBoxWinner)
    }
    
    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(pictures, forKey: .pictures)
        try container.encode(mainFeatures, forKey: .mainFeatures)
        try container.encode(attributes, forKey: .attributes)
        try container.encode(shortDescription, forKey: .shortDescription)
        try container.encode(buyBoxWinner, forKey: .buyBoxWinner)
    }
    
    static func toEntity(_ productModel: ProductModel) -> Product {
        return Product(
            id: productModel.id,
            title: productModel.name,
            description: productModel.shortDescription.content,
            productFeatures: productModel.mainFeatures.map {$0.text},
            productAttributes: Dictionary(
                uniqueKeysWithValues: productModel.attributes.map {
                    ($0.name, $0.valueName)
                }
            ),
            images: productModel.pictures.map{$0.url},
            price: productModel.buyBoxWinner?.price
        )
    }
    
}

struct Picture: Codable {
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

struct MainFeature: Codable {
    let text: String
    let type: String
    
    enum CodingKeys: String, CodingKey {
        case text
        case type
    }

    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        text = try container.decode(String.self, forKey: .text)
        type = try container.decode(String.self, forKey: .type)
    }

    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(text, forKey: .text)
        try container.encode(type, forKey: .type)
    }
}

struct AttributeModel: Codable {
    let name: String
    let valueName: String

    enum CodingKeys: String, CodingKey {
        case name
        case valueName
    }

    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        valueName = try container.decode(String.self, forKey: .valueName)
    }

    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(valueName, forKey: .valueName)
    }
}

struct ShortDescription: Codable {
    let content: String

    enum CodingKeys: String, CodingKey {
        case content
    }

    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        content = try container.decode(String.self, forKey: .content)
    }

    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(content, forKey: .content)
    }
}

struct BuyBoxWinner: Codable {
    let price: Double
    let currencyId: String
    
    enum CodingKeys: String, CodingKey {
        case price
        case currencyId
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.price = Double(try container.decode(Int.self, forKey: .price))
        self.currencyId = try container.decode(String.self, forKey: .currencyId)
    }
    
    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(price, forKey: .price)
        try container.encode(currencyId, forKey: .currencyId)
    }
    
}
