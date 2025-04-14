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
    
    @StateObject private var viewModel: ProductListViewModel = .init()
    
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
            if(viewModel.showErrorMessage) {
                CustomErrorMessageWindow(errorMessage: viewModel.errorMessage)
            } else{
                List(viewModel.products) { product in
                    Button {
                        coordinator.push(.productInfo(productId: product.id))
                    }label: {
                        CustomCellView(
                            imageUrl: product.image,
                            title: product.name
                        )

                        
                        .onAppear {
                            if product.id == viewModel.products.last?.id {
                                Task {
                                    await viewModel.loadProductList(query: searchText, countrySite: countrySite)
                                }
                            }
                        }
                    }
                    .padding(.vertical, 8)
                    .listRowSeparator(.hidden)
                    .listRowInsets(EdgeInsets())
                    .background(Color.yellow)
                }
                .task {
                    print("site: \(countrySite), query: \(searchText)")
                    await viewModel.loadProductList(query: searchText,  countrySite: countrySite)
                }
                .scrollContentBackground(.hidden) // Oculta el fondo por defecto
                .background(Color.yellow)
            }
// Tu color de fondo personalizado
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
