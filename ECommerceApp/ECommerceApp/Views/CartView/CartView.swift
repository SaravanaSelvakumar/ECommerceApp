

import SwiftUI

struct CartView: View {
    @EnvironmentObject var viewModel: MainViewModel
    @EnvironmentObject var alertViewModel: AlertViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.cartItems.isEmpty {
                    VStack(spacing: 16) {
                        Text("🛒")
                            .font(.system(size: 60))
                        
                        Text("Your cart is empty")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(Color(hex: "181b26"))
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .multilineTextAlignment(.center)
                } else {
                    List {
                        ForEach(viewModel.cartItems) { item in
                            CartRowView(cartItem: item)
                                .environmentObject(viewModel)
                                .listRowSeparator(.hidden)
                                .listRowBackground(Color.clear)
                        }
                    }
                    .listStyle(PlainListStyle())
                    .scrollIndicators(.hidden)
                    
                    Button(action: {
                        alertViewModel.displayAlert(title: "Order Placed", message: "Order placed successfully. Thanks for shopping with us!")
                        viewModel.cartItems.removeAll()
                    }) {
                        Text("Checkout")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color(hex: "2a86c7"))
                            .cornerRadius(10)
                            .padding([.horizontal, .bottom])
                    }
                }
            }
            .navigationTitle("Cart")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    CartToolbarItem(quantity: viewModel.totalCartQuantity)
                }
            }
            .alert(isPresented: $alertViewModel.showAlert) {
                Alert(
                    title: Text(alertViewModel.alertTitle),
                    message: Text(alertViewModel.alertMessage),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
    }
}
