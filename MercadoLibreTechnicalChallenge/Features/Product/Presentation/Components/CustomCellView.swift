//
//  CustomCellView.swift
//  MercadoLibreTechnicalChallenge
//
//  Created by Juan Pablo Lasprilla Correa on 10/04/25.
//

import SwiftUI

struct CustomCellView: View {
    var imageUrl: String
    var title: String

    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 0) {
                AsyncImage(url: URL(string: imageUrl)) { phase in
                    switch phase {
                    case .empty:
                        ZStack {
                            Color.gray.opacity(0.2)
                            ProgressView() // Spinner de carga
                        }

                    case .success(let image):
                        image
                            .resizable()

                    case .failure(_):
                        ZStack {
                            Color.red.opacity(0.1)
                            Image(systemName: "photo")
                                .foregroundColor(.gray)
                        }

                    @unknown default:
                        EmptyView()
                    }
                }
                .frame(width: geometry.size.width * 0.3, height: geometry.size.height)
                .clipped()

                Text(title)
                    .font(.headline)
                    .padding()
                    .frame(width: geometry.size.width * 0.7, height: geometry.size.height, alignment: .leading)
                    .background(Color.white)
                    .foregroundColor(.black)
            }
        }
        .frame(height: 150)
        .cornerRadius(10)
        .shadow(radius: 2)
        .padding(.horizontal, 10)
        
    }
}

#Preview {
    let imageUrl: String = "https://mla-s2-p.mlstatic.com/697144-MLA44156107576_112020-F.jpg"
    let title: String = "Apple Iphone se iPhone SE - Plata - 32 GB - 2 GB"
    CustomCellView(imageUrl: imageUrl, title: title)
}
