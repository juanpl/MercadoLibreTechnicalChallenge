//
//  ProductListView.swift
//  MercadoLibreTechnicalChallenge
//
//  Created by Juan Pablo Lasprilla Correa on 10/04/25.
//

import SwiftUI

struct ProductListView: View {
    
    private var viewModel: ProductListViewModel = .init()
    
    var body: some View {
        List(viewModel.products) { product in
            CustomCellView(
                imageUrl: product.name,
                title: product.image
            ).task {
                await viewModel.loadProductList(query: "Iphone")
            }
            
        }
    }
}

#Preview {
    ProductListView()
}
