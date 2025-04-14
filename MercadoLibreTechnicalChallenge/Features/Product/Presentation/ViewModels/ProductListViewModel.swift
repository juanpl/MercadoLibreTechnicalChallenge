import Foundation
import Combine

class ProductListViewModel: ObservableObject {
    
    private let getProductListUseCase: GetProductListUseCase

    // Propiedades observables con @Published
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
        
        guard !moreProductsAreLoading else { return }

        defer { moreProductsAreLoading = false }
        
        let result = await getProductListUseCase.getProductList(query: query, site: countrySite , offset: (pagingCounter*5), limit: 5)
        
        switch result {
        case .success(let list):
            await MainActor.run {
                if list.isEmpty && pagingCounter == 0  {
                    errorMessage = "No hay ningún producto con el nombre: \(query)."
                    showErrorMessage = true
                    return
                }
                
                if !list.isEmpty {
                    //Va concatenando las respuestas a medida que se ejecuta la función
                    self.products += list
                    self.pagingCounter += 1
                    return
                }
            }
            
            
        case .failure(let error):
            print("Error al obtener lista productos: \(error)")
            errorMessage = "Error cargando los productos"
            showErrorMessage = true
        }
    }
}
