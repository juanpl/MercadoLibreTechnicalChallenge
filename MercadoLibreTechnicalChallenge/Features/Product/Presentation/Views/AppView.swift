//
//  AppView.swift
//  MercadoLibreTechnicalChallenge
//
//  Created by Juan Pablo Lasprilla Correa on 11/04/25.
//

import SwiftUI

struct AppView: View {
    @StateObject private var coordinator = NavigationCoordinator()

    var body: some View {
        NavigationStack(path: $coordinator.path) {
            ProductSearchView() // Vista inicial
                .navigationDestination(for: Routes.self) { route in
                    switch route {
                    case let .productList(title, nationality):
                        ProductListView(countrySite: nationality, searchText: title)
                    case let .productInfo(id):
                        ProductInfoView(productId: id)
                    }
                }
        }
        .environmentObject(coordinator)
    }
}
