//
//  ProductInfoMock.swift
//  MercadoLibreTechnicalChallengeTests
//
//  Created by Juan Pablo Lasprilla Correa on 13/04/25.
//


@testable import MercadoLibreTechnicalChallenge
import Foundation

var mockProduct: Product? = nil

struct mockGetProductInfoUseCase: GetProductInfoUseCase {
    func getProductInfo(id: String) async -> Result<MercadoLibreTechnicalChallenge.Product, MercadoLibreTechnicalChallenge.GetProductInfoError> {
        if(id == "MCO30400479"){
            let product: Product = Product(
                id: "MCO30400479",
                title: " iPhone 3G",
                description: "Si buscas un dispositivo que te permita estar en contacto siempre, este teléfono iPhone 3G es una opción excelente. Podrás comunicarte de manera inmediata con amigas y amigos, o con las personas de tu familia. Y además, si estás trabajando, lograrás una mayor colaboración con tu equipo. \n\n",
                productFeatures: ["Dispositivo desbloqueado para que elijas la compañía telefónica que prefieras."],
                productAttributes: [
                    "Marca":"Apple",
                    "Línea":"iPhone 3",
                    "Modelo":"iPhone 3G",
                    "Es Dual SIM": "No",
                    "Nombre del sistema operativo": "iOS",
                    "Número de homologación de Anatel": "11240801993",
                    "Versiones":"A1324, A1241"
                    
                ],
                images: [
                    "https://http2.mlstatic.com/D_NQ_NP_796973-MLA28284457453_102018-F.jpg",
                    "https://http2.mlstatic.com/D_NQ_NP_795144-MLU78959265312_092024-F.jpg"
                ],
                price: nil)
            return .success(product)
        }
        else {
            return .failure(.getProductInfoFailed)
        }
    }
}
