//


import SwiftUI

struct CartToolbarItem: View {
    let quantity: Int
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Image(systemName: "cart")
                .font(.system(size: 20))
                .foregroundColor(.black)
            
            if quantity > 0 {
                Text("\(quantity)")
                    .font(.caption2)
                    .foregroundColor(.white)
                    .padding(5)
                    .background(Color.red)
                    .clipShape(Circle())
                    .offset(x: 10, y: -10)
            }
        }
        .padding(.trailing, 5)
    }
}
