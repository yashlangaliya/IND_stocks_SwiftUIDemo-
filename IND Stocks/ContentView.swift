//
//  ContentView.swift
//  IND Stocks
//
//  Created by yash-mac on 05/05/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]

    var body: some View {
        ZStack {
            VStack{
                Text("Accent Color")
                    .foregroundStyle(Color.theme.accentColor)
                    .padding()
                Text("Green Color")
                    .foregroundStyle(Color.theme.greenColor)
                    .padding()
                Text("Red Color")
                    .foregroundStyle(Color.theme.redColor)
                    .padding()
                Text("Secondary Text Color")
                    .foregroundStyle(Color.theme.secondaryTextColor)
                    .padding()
                    
            }
            .background(Color.theme.backgroundColor)
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
