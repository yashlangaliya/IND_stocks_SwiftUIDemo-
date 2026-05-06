//
//  CircleButton.swift
//  IND Stocks
//
//  Created by yash-mac on 05/05/26.
//

import SwiftUI

struct CircleButton: View {
    let iconName: String
    var body: some View {
         Image(systemName: iconName)
            .font(.headline)
            .foregroundStyle(Color.theme.accentColor)
            .frame(width: 50, height: 50)
            .background(
                Circle()
                    .foregroundStyle(Color.theme.backgroundColor)
            )
            .shadow(color: Color.theme.accentColor.opacity(0.5), radius: 10)
            .padding()
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    CircleButton(iconName: "heart.fill")
}
