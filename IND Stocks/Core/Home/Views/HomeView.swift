//
//  HomeView.swift
//  IND Stocks
//
//  Created by yash-mac on 05/05/26.
//

import SwiftUI

struct HomeView: View {
    
    @State var showWishlist: Bool = false
    
    var body: some View {
        ZStack {
            //Background colour.
            Color.theme.backgroundColor
                .ignoresSafeArea()
            VStack {
                //Header view
                homeHeader
                Spacer()
            }
        }
    }
}

extension HomeView {
    private var homeHeader: some View {
        HStack {
            CircleButton(iconName: showWishlist ? "plus" : "info")
                .animation(.none, value: showWishlist)
                .background(
                    CircleButtonAnimationView(isAnimating: $showWishlist)
                        .foregroundStyle(Color.theme.accentColor)
                )
            Spacer()
            Text(showWishlist ? "Wishlist" : "IND Stocks")
                .animation(.none , value: showWishlist)
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(Color.theme.accentColor)
            Spacer()
            CircleButton(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: showWishlist ? 180 : 0))
                .onTapGesture {
                    withAnimation(.spring) {
                        showWishlist.toggle()
                    }
                }
        }
        .padding(.horizontal)
    }
}

#Preview {
    NavigationStack {
        HomeView()
            .navigationBarBackButtonHidden()
    }
    
}
