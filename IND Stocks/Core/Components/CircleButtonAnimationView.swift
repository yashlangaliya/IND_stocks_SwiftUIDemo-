//
//  CircleButtonAnimationView.swift
//  IND Stocks
//
//  Created by yash-mac on 06/05/26.
//

import SwiftUI

struct CircleButtonAnimationView: View {
    @Binding var isAnimating: Bool
    var body: some View {
        Circle()
            .stroke(lineWidth: 5)
            .scale(isAnimating ? 1 : 0)
            .opacity(isAnimating ? 0 : 1)
            .animation(isAnimating ? .spring : .none, value: isAnimating)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    CircleButtonAnimationView(isAnimating: .constant(true))
        .foregroundStyle(Color.theme.accentColor)
        .frame(width: 50, height: 50)
}
