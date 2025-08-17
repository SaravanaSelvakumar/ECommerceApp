



import SwiftUI

struct HomeView: View {
    @EnvironmentObject var viewModel: MainViewModel
    @EnvironmentObject var alertViewModel: AlertViewModel
    @State private var isSearching = false
    @State private var selectedProduct: Product?
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                
                VStack(alignment: .leading, spacing: 16) {
                    Text("🔥 Flash Sale")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                    
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(viewModel.products) { product in
                            Button {
                                selectedProduct = product
                            } label: {
                                ProductGridView(product: product)
                                    .environmentObject(viewModel)
                                    .environmentObject(alertViewModel)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.top)
            }
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(false)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        isSearching = true
                    }) {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.black)
                    }
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    CartToolbarItem(quantity: viewModel.totalCartQuantity)
                }
                
            }
            .navigationDestination(item: $selectedProduct) { product in
                ProductDetailView(product: product)
                    .environmentObject(viewModel)
                    .environmentObject(alertViewModel)
            }
            .navigationDestination(isPresented: $isSearching){
                SearchScreenView()
                    .environmentObject(viewModel)
                    .environmentObject(alertViewModel)
            }
            .alert(isPresented: $alertViewModel.showAlert) {
                Alert(title: Text(alertViewModel.alertTitle),
                      message: Text(alertViewModel.alertMessage),
                      dismissButton: .default(Text("OK")))
            }
        }
    }
}


