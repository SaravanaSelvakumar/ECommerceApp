
import SwiftUI

struct CartRowView: View {
    @EnvironmentObject var viewModel: MainViewModel
    @EnvironmentObject var alertViewModel: AlertViewModel
    let cartItem: CartItem
    
    var body: some View {
        let product = cartItem.product
        
        HStack(alignment: .top, spacing: 12) {
            AsyncImage(url: product.imageURL) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
            }
            .frame(width: 100, height: 100)
            .cornerRadius(8)
            .clipped()
            
            VStack(alignment: .leading, spacing: 8) {
                Text(product.title)
                    .font(.headline)
                    .lineLimit(1)
                
                Text(product.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
                
                HStack {
                    Text(product.formattedPrice)
                        .foregroundColor(.primary)
                        .bold()
                    Spacer()
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                        .font(.caption)
                    Text(product.formattedRating)
                        .font(.caption)
                        .foregroundColor(Color(hex: "181b26"))
                    Text(product.formattedRatingCount)
                        .font(.caption2)
                        .foregroundColor(.gray)
                }
                
                HStack {
                    Image(systemName: "minus.circle.fill")
                        .foregroundColor(.red)
                        .font(.title2)
                        .onTapGesture {
                            viewModel.removeFromCart(product)
                        }
                    
                    Text("\(cartItem.quantity)")
                        .font(.subheadline)
                        .padding(.horizontal, 8)
                    
                    
                    Image(systemName: "plus.circle.fill")
                        .foregroundColor(.green)
                        .font(.title2)
                        .onTapGesture {
                            viewModel.addToCart(product)
                        }
                    
                    Spacer()
                    
                    
                    Image(systemName: "trash")
                        .foregroundColor(.red)
                        .font(.system(size: 18))
                        .onTapGesture {
                            viewModel.deleteFromCart(product)
                        }
                }
                .padding(.top, 4)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.2), radius: 8, x: 0, y: 4)
    }
}

