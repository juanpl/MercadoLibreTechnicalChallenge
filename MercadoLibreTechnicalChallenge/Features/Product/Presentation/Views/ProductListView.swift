//
//  ProductListView.swift
//  MercadoLibreTechnicalChallenge
//
//  Created by Juan Pablo Lasprilla Correa on 10/04/25.
//

import SwiftUI

struct ProductListView: View {
    @EnvironmentObject var coordinator: NavigationCoordinator
    
    var countrySite: String
    var searchText: String
    
    private var viewModel: ProductListViewModel = .init()
    
    init(countrySite: String, searchText: String) {
        self.countrySite = countrySite
        self.searchText = searchText
    }
    
    var body: some View {
            VStack {
                Spacer().frame(height:20)
                HStack{
                    Text("Busqueda:")
                    Text("\(searchText)")
                        .fontWeight(.bold)
                        .lineLimit(2)
                }
                .padding(.horizontal, 30)
                List(viewModel.products) { product in
                    Button {
                        coordinator.push(.productInfo(productId: product.id))
                    }label: {
                        CustomCellView(
                            imageUrl: product.image,
                            title: product.name
                        )

                        
                        .onAppear {
                            Task{
                                await viewModel.loadProductList(query: searchText,  countrySite: countrySite)
                            }
                        }
                    }
                    .padding(.vertical, 5)
                    .listRowSeparator(.hidden) // Oculta la línea separadora
                    .listRowInsets(EdgeInsets()) // Elimina márgenes internos de la celda
                    .background(Color.yellow) // Fondo del item (opcional)
                }
                .task {
                    print("site: \(countrySite), query: \(searchText)")
                    await viewModel.loadProductList(query: searchText,  countrySite: countrySite)
                }
                .scrollContentBackground(.hidden) // Oculta el fondo por defecto
                .background(Color.yellow) // Tu color de fondo personalizado
            }
            .background(Color.yellow)
            
        

    }
}

#Preview {
    ProductListView(
        countrySite: "MCO",
        searchText: "xbox"
    ).environmentObject(NavigationCoordinator())
}
