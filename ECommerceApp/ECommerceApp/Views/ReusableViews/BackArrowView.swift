

import SwiftUI

struct BackArrowView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Button(action: {
            withAnimation {
                presentationMode.wrappedValue.dismiss()
            }
        }) {
            Image(systemName: "arrow.left")
                .font(.system(size: 17, weight: .medium))
                .foregroundColor(.black)
        }
    }
}
