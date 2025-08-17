

import SwiftUI

struct ProductDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var alertViewModel: AlertViewModel
    @EnvironmentObject var viewModel: MainViewModel
    let product: Product
    
    var body: some View {
        ScrollView(showsIndicators: false){
            VStack(alignment: .leading, spacing: 16) {
                AsyncImage(url: product.imageURL) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 300)
                        .frame(maxWidth: .infinity)
                        .clipped()
                } placeholder: {
                    Rectangle()
                        .fill(Color.gray.opacity(0.3))
                        .frame(height: 300)
                        .frame(maxWidth: .infinity)
                }
                
                Text(product.title)
                    .font(.title2)
                    .bold()
                    .lineLimit(nil)
                
                HStack {
                    Text(product.formattedPrice)
                        .font(.title3)
                        .bold()
                        .foregroundColor(.primary)
                    
                    Spacer()
                    
                    HStack(spacing: 4) {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Text(product.formattedRating)
                            .font(.subheadline)
                            .foregroundColor(Color(hex: "181b26"))
                        Text(product.RatingWithReviews)
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    .padding(.trailing, 5)
                }
                
                Text(product.description)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .padding(.bottom, 8)
                
                Spacer()
                
                Button(action: {
                    viewModel.addToCart(product)
                    alertViewModel.displayAlert(title: "Success", message: "Added to cart successfully!")
                }) {
                    Text("Add to Cart")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color(hex: "2980b9"))
                        .cornerRadius(10)
                }
                .padding(.bottom, 20)
                
            }
            .padding()
        }
        .navigationTitle("Product Details")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .toolbar(.hidden, for: .tabBar)
        .toolbar {
            /// Back arrow
            ToolbarItem(placement: .navigationBarLeading) {
                BackArrowView()
            }
            
            /// Cart Icon
            ToolbarItem(placement: .navigationBarTrailing) {
                CartToolbarItem(quantity: viewModel.totalCartQuantity)
            }
        }
        .alert(isPresented: $alertViewModel.showAlert) {
            Alert(title: Text(alertViewModel.alertTitle),
                  message: Text(alertViewModel.alertMessage),
                  dismissButton: .default(Text("OK")){
                withAnimation {
                    presentationMode.wrappedValue.dismiss()
                }})
        }
    }
}

