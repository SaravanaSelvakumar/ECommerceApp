

import Foundation

struct CartItem: Identifiable, Hashable {
    var id: Int { product.id }
    let product: Product
    var quantity: Int
}
