//
//  StockRowView.swift
//  IND Stocks
//
//  Created by yash-mac on 06/05/26.
//

import SwiftUI

struct StockRowView: View {
    
    var stock: StockModel
    var priceUp : Bool {
       return stock.percentChange > 0
    }
    var body: some View {
        HStack(alignment: .top) {
            Text(stock.companyName)
                .font(.headline)
                .foregroundStyle(Color.theme.accentColor)
            Spacer()
            VStack(alignment: .trailing) {
                Text(stock.close.asCurrency())
                    .font(.headline)
                    .bold()
                    .foregroundStyle(Color.theme.accentColor)
                
                Label {
                    Text(stock.percentChange.asPercent())
                        .font(.subheadline)
                        .foregroundStyle(priceUp ? Color.theme.greenColor : Color.theme.redColor)
                } icon: {
                    Image(systemName: priceUp ? "chevron.up" : "chevron.down")
                        .foregroundStyle(priceUp ? Color.theme.greenColor : Color.theme.redColor)
                }
                
                
                
                
            }
        }
        .padding(.horizontal)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    StockRowView(stock: StockModel.mock)
}
