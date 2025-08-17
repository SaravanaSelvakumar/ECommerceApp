//
//  Untitled.swift
//  ECommerceApp
//
//  Created by Saravanan S on 16/08/25.
//

import SwiftUI

struct SplashScreen: View {
    var body: some View {
        ZStack {
            Color(hex: "c3e600")
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                Image("iconcart")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .shadow(radius: 5)
                
                Text("Shop ME")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.primary)
            }
        }
    }
}
