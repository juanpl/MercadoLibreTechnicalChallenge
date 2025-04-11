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
            VStack {
                Spacer().frame(height:20)
                HStack{
                    Text("Busqueda:")
                    Text("XBOX")
                        .fontWeight(.bold)
                        .lineLimit(2)
                }
                .padding(.horizontal, 30)
                List(viewModel.products) { product in
                    CustomCellView(
                        imageUrl: product.image,
                        title: product.name
                    )
                    .padding(.vertical, 5) // 🟡 Espacio entre ítems
                    .listRowSeparator(.hidden) // Oculta la línea separadora
                    .listRowInsets(EdgeInsets()) // Elimina márgenes internos de la celda
                    .background(Color.yellow) // Fondo del item (opcional)
                }
                .task {
                    await viewModel.loadProductList(query: "xbox")
                }
                .scrollContentBackground(.hidden) // Oculta el fondo por defecto
                .background(Color.yellow) // Tu color de fondo personalizado
            }
            .background(Color.yellow)
            
        

    }
}

#Preview {
    ProductListView()
}
