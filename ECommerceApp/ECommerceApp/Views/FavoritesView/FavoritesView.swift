

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var viewModel: MainViewModel
    @EnvironmentObject var alertViewModel: AlertViewModel
    @State private var isAnimating = false
    
    var body: some View {
        VStack(spacing: 16) {            
            Image(systemName: "heart.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60)
                .foregroundColor(.red)
                .scaleEffect(isAnimating ? 1.2 : 1.0)
                .animation(
                    .easeInOut(duration: 0.8).repeatForever(autoreverses: true),
                    value: isAnimating
                )
                .onAppear {
                    isAnimating = true
                }
            
            Text("No favorites yet — explore and add your top picks!")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(Color(hex: "181b26"))
                .padding(.horizontal, 8)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .multilineTextAlignment(.center)
        .navigationTitle("Favorites")
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
