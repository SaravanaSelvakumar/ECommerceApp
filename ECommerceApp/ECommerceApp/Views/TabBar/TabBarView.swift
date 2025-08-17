

import SwiftUI

struct TabBar: View {
    @State var selectedTab: Int = 0
    @EnvironmentObject var viewModel: MainViewModel
    @EnvironmentObject var alertViewModel: AlertViewModel
    
    var body: some View {
        TabView(selection: $selectedTab) {
            
            NavigationView {
                HomeView()
                    .environmentObject(viewModel)
                    .environmentObject(alertViewModel)
            }
            .tabItem {
                Label("Home", systemImage: "house")
            }
            .tag(0)
            
            NavigationView {
                CategoryView()
                    .environmentObject(viewModel)
                    .environmentObject(alertViewModel)
            }
            .tabItem {
                Label("Category", systemImage: "square.grid.2x2.fill")
            }
            .tag(1)
            
            NavigationView {
                CartView()
                    .environmentObject(viewModel)
                    .environmentObject(alertViewModel)
            }
            .tabItem {
                Label("Cart", systemImage: "cart")
            }
            .tag(2)
            
            NavigationView {
                FavoritesView()
                    .environmentObject(viewModel)
                    .environmentObject(alertViewModel)
            }
            .tabItem {
                Label("Favorites", systemImage: "heart")
            }
            .tag(3)
            
            NavigationStack {
                ProfileView()
                    .environmentObject(viewModel)
                    .environmentObject(alertViewModel)
            }
            .tabItem {
                Label("Profile", systemImage: "person.fill")
            }
            .tag(4)
        }
    }
}
