

import SwiftUI
import Observation
import Foundation



class MainViewModel: ObservableObject {
    @Published var products: [Product] = []
    @Published var cartItems: [CartItem] = []
    @Published var searchText: String = ""
    
    /// variables for Cart and Search
    var totalCartQuantity: Int {
        cartItems.reduce(0) { $0 + $1.quantity }
    }
    
    var filteredProducts: [Product] {
        if searchText.isEmpty {
            return products
        } else {
            return products.filter {
                $0.title.localizedCaseInsensitiveContains(searchText) ||
                $0.description.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    
    /// Function Calls
    
        func fetchProducts(alertViewModel: AlertViewModel) {
        guard let url = URL(string: baseURL) else {
            alertViewModel.displayAlert(message: "Invalid URL.")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    alertViewModel.displayAlert(message: error.localizedDescription)
                    return
                }
                
                guard let data = data else {
                    alertViewModel.displayAlert(message: "No data received from server.")
                    return
                }
                
                do {
                    let decodedResponse = try JSONDecoder().decode([Product].self, from: data)
                    self.products = decodedResponse
                } catch {
                    alertViewModel.displayAlert(message: JSON_CONVERSION_ERROR)
                }
            }
        }.resume()
    }
    
    func addToCart(_ product: Product) {
        if let index = cartItems.firstIndex(where: { $0.product.id == product.id }) {
            if cartItems[index].quantity < 30 {
                cartItems[index].quantity += 1
            }
        } else {
            cartItems.append(CartItem(product: product, quantity: 1))
        }
    }
    
    func removeFromCart(_ product: Product) {
        if let index = cartItems.firstIndex(where: { $0.product.id == product.id }) {
            if cartItems[index].quantity > 1 {
                cartItems[index].quantity -= 1
            } else {
                cartItems.remove(at: index)
            }
        }
    }
    
    func deleteFromCart(_ product: Product) {
        cartItems.removeAll { $0.product.id == product.id }
    }
}
