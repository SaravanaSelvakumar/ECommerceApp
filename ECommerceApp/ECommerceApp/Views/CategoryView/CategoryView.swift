


import SwiftUI

import SwiftUI

struct CategoryView: View {
    @EnvironmentObject var viewModel: MainViewModel
    @EnvironmentObject var alertViewModel: AlertViewModel
    let categories = [ "Electronics", "Books", "Fashion", "Home", "Toys", "Beauty", "Sports", "Accessories" ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 120), spacing: 16)], spacing: 16) {
                ForEach(categories, id: \.self) { category in
                    Button(action: {
                        alertViewModel.displayAlert(
                            title: "Category Selected",
                            message: "You Choose \(category)"
                        )
                    }) {
                        VStack(spacing: 10) {
                            Image(systemName: iconForCategory(category))
                                .resizable()
                                .scaledToFit()
                                .frame(height: 40)
                                .foregroundColor(Color(hex: "2a86c7"))
                            
                            Text(category)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundColor(.primary)
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(12)
                    }
                }
            }
            .padding()
        }
        .navigationTitle("Category")
        .navigationBarTitleDisplayMode(.inline)
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
    
    func iconForCategory(_ category: String) -> String {
        switch category {
        case "Electronics": return "bolt.fill"
        case "Books": return "book.fill"
        case "Fashion":
            return UIImage(systemName: "figure.dress") != nil ? "figure.dress" : "tshirt.fill"
        case "Home": return "house.fill"
        case "Toys": return "gamecontroller.fill"
        case "Beauty": return "sparkles"
        case "Sports": return "sportscourt"
        case "Accessories": return "bag.fill"
        default: return "circle"
        }
    }
}

