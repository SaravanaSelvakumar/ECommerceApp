

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var viewModel: MainViewModel
    @EnvironmentObject var alertViewModel: AlertViewModel
    @State private var isSearching = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                VStack(spacing: 8) {
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.blue)
                    
                    Text("John Doe")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Text("johndoe@example.com")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding(.top, 40)
                
                Divider()
                
                VStack(alignment: .leading, spacing: 20) {
                    ProfileRow(icon: "gear", title: "Settings")
                    ProfileRow(icon: "creditcard", title: "Payment Methods")
                    ProfileRow(icon: "cart", title: "Order History")
                    ProfileRow(icon: "heart", title: "Wishlist")
                    ProfileRow(icon: "questionmark.circle", title: "Help & Support")
                }
                .padding(.horizontal)
                
                Spacer()
            }
            .padding()
        }
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                CartToolbarItem(quantity: viewModel.totalCartQuantity)
            }
        }
        .alert(isPresented: $alertViewModel.showAlert) {
            Alert(title: Text(alertViewModel.alertTitle),
                  message: Text(alertViewModel.alertMessage),
                  dismissButton: .default(Text("OK")))
        }
    }
}
