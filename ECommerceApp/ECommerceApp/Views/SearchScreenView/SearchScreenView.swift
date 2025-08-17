

import SwiftUI

struct SearchScreenView: View {
    @EnvironmentObject var alertViewModel: AlertViewModel
    @EnvironmentObject var viewModel: MainViewModel
    
    var body: some View {
        VStack {
            HStack {
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    
                    TextField("Search...", text: $viewModel.searchText)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                }
                .padding(.horizontal, 15)
                .padding(.vertical, 10)
                .padding(.trailing, 35)
                .background(
                    ZStack{
                        Rectangle().fill(.gray.opacity(0.2))
                        Rectangle().fill(.ultraThinMaterial)
                    }
                        .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                )
                .overlay(
                    HStack {
                        if !viewModel.searchText.isEmpty {
                            Spacer()
                            Button(action: {
                                withAnimation {
                                    viewModel.searchText = ""
                                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                                }
                            }) {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(.gray)
                            }
                            .padding(.trailing, 12)
                        }
                    }
                )
                .padding(.horizontal)
            }
            .padding(.vertical, 10)
            Spacer()
            
            ScrollView(showsIndicators: false) {
                LazyVStack(spacing: 12) {
                    ForEach(viewModel.filteredProducts) { product in
                        NavigationLink(destination: ProductDetailView(product: product)
                            .environmentObject(viewModel)
                            .environmentObject(alertViewModel)
                        )
                        {
                            ProductRowView(product: product)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding(.horizontal)
            }
            Spacer()
            
        }
        .navigationTitle("Search Products")
        .navigationBarBackButtonHidden()
        .navigationBarTitleDisplayMode(.inline)
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
                  dismissButton: .default(Text("OK")))
        }
    }
}
