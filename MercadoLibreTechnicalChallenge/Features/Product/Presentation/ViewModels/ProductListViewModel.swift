import Foundation
import Combine

class ProductListViewModel: ObservableObject {
    
    private let getProductListUseCase: GetProductListUseCase

    @Published var products: [ProductListItem]
    @Published var pagingCounter: Int = 0
    @Published var errorMessage: String = ""
    @Published var showErrorMessage: Bool = false
    @Published var moreProductsAreLoading: Bool = false

    init(products: [ProductListItem] = [],
         getProductListUseCase: GetProductListUseCase = GetProductListImp()) {
        self.products = products
        self.getProductListUseCase = getProductListUseCase
    }

    func loadProductList(query: String, countrySite: String) async {

        await MainActor.run {
            if moreProductsAreLoading { return }
            moreProductsAreLoading = true
        }

        let result = await getProductListUseCase.getProductList(query: query,site: countrySite,offset: pagingCounter * 5,limit: 5)

        await MainActor.run {
            defer { moreProductsAreLoading = false }

            switch result {
            case .success(let list):
                if list.isEmpty && pagingCounter == 0 {
                    errorMessage = "No hay ningún producto con el nombre: \(query)."
                    showErrorMessage = true
                } else if !list.isEmpty {
                    // Elimina duplicados antes de agregar
                    let nuevos = list.filter { nuevo in
                        !self.products.contains(where: { $0.id == nuevo.id })
                    }
                    self.products += nuevos
                    self.pagingCounter += 1
                }

            case .failure(let error):
                print("Error al obtener lista productos: \(error)")
                errorMessage = "Error cargando los productos"
                showErrorMessage = true
            }
        }
    }
}
