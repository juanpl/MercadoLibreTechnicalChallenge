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
    func fetchProductListFromAPI(query: String, site: String, offset: Int, limit: Int) async -> Result<[ProductListItem], MercadoLibreRemoteDataSourceError>
    func fetchProductInfoFromAPI(id: String) async -> Result<Product, MercadoLibreRemoteDataSourceError>
}

class MercadoLibreRemoteDataSource: MercadoLibreRemoteDataSourceProtocol {
    
    
    //TODO: El site_id debe cambiar dependiendo de la ubicacion en la que este el usuario
    private let mercadiLibreURL: String
    private let accesToken: String
    private let session: URLSession
    
    init(
         mercadiLibreURL: String = "https://api.mercadolibre.com",
         accesToken: String = "APP_USR-8880650627470842-041015-4d47cf5cc50dc219d9a9f92baa2a5534-556123717",
         session: URLSession = .shared
    ) {
        self.mercadiLibreURL = mercadiLibreURL
        self.accesToken = accesToken
        self.session = session
    }
    
    
    
    
    func fetchProductListFromAPI(query: String, site: String, offset: Int, limit: Int) async -> Result<[ProductListItem], MercadoLibreRemoteDataSourceError> {

        let urlString = "\(mercadiLibreURL)/products/search?status=active&site_id=\(site)&q=\(query)&offset=\(offset)&limit=\(limit)"
        
        //codifica caracteres extraños
        guard let encoded = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
        let url = URL(string: encoded) else {
            return .failure(.invalidURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        //TODO: Implementar el token de autenticación
        request.setValue("Bearer \(accesToken)", forHTTPHeaderField: "Authorization")
        
        do {
            
            let (data, _) = try await session.data(for: request)
            let response = try JSONDecoder().decode(ProductListItemModel.self, from: data)
            let productListItemModel: [ProductListItem] = ProductListItemModel.toEntity(response)
            return .success(productListItemModel)
            
        } catch let decodingError as DecodingError {
            return .failure(.decoding(decodingError))
            
        } catch {
            return .failure(.network(error))
            
        }
    }
    
    func fetchProductInfoFromAPI(id: String) async -> Result<Product, MercadoLibreRemoteDataSourceError> {
        let urlString = "\(mercadiLibreURL)/products/\(id)"
        
        guard let url = URL(string: urlString) else {
            return .failure(.invalidURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        //TODO: Implementar el token de autenticación
        request.setValue("Bearer \(accesToken)", forHTTPHeaderField: "Authorization")
        
        do {
            let (data, _) = try await session.data(for: request)
            let response = try JSONDecoder().decode(ProductModel.self, from: data)
            let product: Product = ProductModel.toEntity(response)
            return .success(product)
            
        } catch let decodingError as DecodingError {
            print("Error al decodificar:", decodingError)
            return .failure(.decoding(decodingError))
            
        } catch {
            return .failure(.network(error))
        }
        
    }
    
    
}
