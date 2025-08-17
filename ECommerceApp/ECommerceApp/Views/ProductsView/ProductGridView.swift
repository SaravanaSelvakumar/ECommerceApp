

import SwiftUI

import SwiftUI

struct ProductGridView: View {
    let product: Product
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            AsyncImage(url: product.imageURL) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 120)
                    .frame(maxWidth: .infinity)
                    .clipped()
            } placeholder: {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(height: 120)
                    .frame(maxWidth: .infinity)
            }
            
            Text(product.title)
                .font(.headline)
                .lineLimit(2)
                .padding(.top, 5)
            
            Text(product.description)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .lineLimit(2)
            
            Text(product.formattedPrice)
                .font(.subheadline)
                .foregroundColor(.primary)
                .bold()
            
            HStack(spacing: 4) {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                    .font(.caption)
                Text(product.formattedRating)
                    .font(.caption)
//                    .foregroundColor(.secondary)
                    .foregroundColor(Color(hex: "181b26"))
                Text(product.RatingWithReviews)
                    .font(.caption2)
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.2), radius: 8, x: 0, y: 4)
    }
}


