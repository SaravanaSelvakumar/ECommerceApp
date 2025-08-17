
import SwiftUI

struct ContentView: View {
    @State private var isActive = false
    @StateObject var viewModel = MainViewModel()
    @StateObject var alertViewModel = AlertViewModel()
    
    var body: some View {
        Group {
            if isActive {
                TabBar()
                    .environmentObject(viewModel)
                    .environmentObject(alertViewModel)
            }  else {
                SplashScreen()
            }
        }
        .onAppear {
            viewModel.fetchProducts(alertViewModel: alertViewModel)
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    isActive = true
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
