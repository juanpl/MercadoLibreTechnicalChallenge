//
//  MercadoLibreRemoteDataSource.swift
//  MercadoLibreTechnicalChallenge
//
//  Created by Juan Pablo Lasprilla Correa on 6/04/25.
//

import Foundation

enum MercadoLibreRemoteDataSourceError: Error {
    case invalidURL
    case decoding(Error)
    case network(Error)
}

protocol MercadoLibreRemoteDataSourceProtocol {
    func getProductList(query: String, offset: Int, limit: Int) async -> Result<[ProductListItem], MercadoLibreRemoteDataSourceError>
    func getProductInfo(id: String) async -> Result<Product, MercadoLibreRemoteDataSourceError>
}

class MercadoLibreRemoteDataSource: MercadoLibreRemoteDataSourceProtocol {
    
    
    //TODO: El site_id debe cambiar dependiendo de la ubicacion en la que este el usuario
    private let mercadiLibreURL: String
    private let session: URLSession
    
    init(session: URLSession,
        mercadiLibreURL: String = "https://api.mercadolibre.com/products/search?status=active&site_id=MLC"
    ) {
        self.mercadiLibreURL = mercadiLibreURL
        self.session = session
    }
    
    
    func getProductList(query: String, offset: Int, limit: Int) async -> Result<[ProductListItem], MercadoLibreRemoteDataSourceError> {
        /*let urlString = "\(mercadiLibreURL)&q=\(query)&offset=\(offset)&limit=\(limit)"
        
        //codifica caracteres extraños
        guard let encoded = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
        let url = URL(string: encoded) else {
            return .failure(.invalidURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        //TODO: Implementar el token de autenticación
        request.setValue("Bearer token", forHTTPHeaderField: "Authorization")
        
        do {
            let (data, _) = try await session.data(for: request)
            let response = try JSONDecoder().decode(ProductModel.self, from: data)
            return .success(response)
        } catch let decodingError as DecodingError {
            return .failure(.decoding(decodingError))
        } catch {
            return .failure(.network(error))
        }*/
    }
    
    func getProductInfo(id: String) async -> Result<Product, MercadoLibreRemoteDataSourceError> {
        <#code#>
    }
    
    
}
