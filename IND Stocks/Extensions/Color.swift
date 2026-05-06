//
//  Color.swift
//  IND Stocks
//
//  Created by yash-mac on 05/05/26.
//

import Foundation
import UIKit
import SwiftUI

extension Color {
    static let theme = ThemeColors()
}

struct ThemeColors {
    let accentColor = Color("AccentColor")
    let backgroundColor = Color("BackgroundColor")
    let greenColor = Color("GreenColor")
    let redColor = Color("RedColor")
    let secondaryTextColor = Color("SecondaryTextColor")
}
