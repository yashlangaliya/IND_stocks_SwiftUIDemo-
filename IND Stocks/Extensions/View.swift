//
//  View.swift
//  IND Stocks
//
//  Created by yash-mac on 13/05/26.
//

import Foundation
import SwiftUI

extension View {
    func listTitleStyle() -> some View {
        self.modifier(ListTitleModifier())
    }
}

struct ListTitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title2)
            .bold()
            .foregroundStyle(Color.theme.accentColor)
    }
}
