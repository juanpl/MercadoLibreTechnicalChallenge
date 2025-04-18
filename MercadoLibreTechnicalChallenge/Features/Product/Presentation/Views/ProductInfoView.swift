//
//  ProductInfoView.swift
//  MercadoLibreTechnicalChallenge
//
//  Created by Juan Pablo Lasprilla Correa on 11/04/25.
//

import SwiftUI

struct ProductInfoView: View {
    
    
    var productId: String
    @StateObject private var viewModel: ProductInfoViewModel = .init()
    
    init(productId: String) {
        self.productId = productId
    }
    
    var body: some View {
        if(viewModel.showErrorMessage){
            CustomErrorMessageWindow(errorMessage: viewModel.errorMessage)
        }
        else {
            ScrollView {
                VStack{
                    if let product = viewModel.product {
                        Text(product.title)
                            .font(.title)
                            .padding()
                        TabView {
                            ForEach(product.images, id: \.self) { url in
                                AsyncImage(url: URL(string: url)) { image in
                                    image
                                        .resizable()
                                        .scaledToFit()
                                } placeholder: {
                                    ProgressView()
                                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                                    
                                }
                            }
                        }
                        .tabViewStyle(.page)
                        .indexViewStyle(.page(backgroundDisplayMode: .always))
                        .frame(height: 300)
                        .padding(.bottom, 20)
                        if let price = viewModel.product?.price {
                            Text("$\(price)")
                                .font(.title)
                                .padding(.bottom, 30)
                        } else {
                            Text("⚠️ Este producto no está disponible por el momento")
                                .padding(.bottom, 30)
                                .font(.title3)
                                
                        }
                        
                        Text("Lo que debes saber de este producto:")
                            .font(.title3)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        LazyVStack(alignment: .leading, spacing: 8) {
                            ForEach(viewModel.product!.productFeatures, id: \.self) { feature in
                                Text("* \(feature)")
                                    .padding(.vertical, 4)
                            }
                        }
                        .listStyle(.plain)
                        .scrollContentBackground(.hidden)
                        .background(Color.clear)
                        .scrollDisabled(true)
                        .padding(.horizontal, 10)
                        .padding(.bottom, 40)
                        
                        Text("Caracterialísticas del generales")
                            .font(.title3)
                            .padding(.bottom, 10)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .fontWeight(.bold)
                        
                        LazyVStack(alignment: .leading, spacing: 8) {
                            ForEach(Array(viewModel.product!.productAttributes), id: \.key) { key, value in
                                HStack {
                                    Text(" \(key): ")
                                        .fontWeight(.bold)
                                    Spacer()
                                    Text("\(value)")
                 
                                }
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                Divider()
                                    .background(Color.black.opacity(0.3))
                            }
                        }
                        .background(Color.white) // o cualquier fondo
                        .cornerRadius(10)
                        
                        Text("Descripción: ")
                            .font(.title3)
                            .padding(.bottom, 10)
                            .padding(.top, 30)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("\(viewModel.product!.description)")
              
                        
                        
                        
                    } else {
                        ProgressView("Cargando producto...")
                    }
                }
                .padding(.horizontal,25)
                .toolbarBackground(Color.yellow, for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)
                .task {
                    await viewModel.loadProductInfo(id: productId)
                }
            }
        
        }

    }

}


#Preview {
    ProductInfoView(productId: "MCO30400479")
}
