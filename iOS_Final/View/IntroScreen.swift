//
//  IntroScreen.swift
//  iOS_Final
//
//  Created by Trin Pongsri on 1/4/2567 BE.
//

import SwiftUI

struct IntroScreen: View {
    // Visibility Status
    @AppStorage("isFirstTime") private var isFirstTime: Bool = false
    var body: some View {
        VStack(spacing:15) {
            Text("What's is the\n BNP MONEY+")
                .font(.largeTitle.bold())
                .multilineTextAlignment(.center)
                .padding(.top,65)
                .padding(.bottom,25)
            // Points View
            VStack(alignment: .leading, spacing: 25, content: {
                PointView(symbol: "bahtsign", title: "Transactions", subTitle: "Keep track of your earning and expenses.")
                PointView(symbol: "chart.xyaxis.line", title: "Visual Charts", subTitle: "View your rtansactions using eye-catching graphic representations.")
                PointView(symbol: "sparkle.magnifyingglass", title: "Advance Filters", subTitle: "Find the expenses you want by advance search and filtering.")
            })
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 15)
        
            Spacer(minLength: 10)
            
            Button(action: {
                isFirstTime = false
            }, label: {
                Text("Continue")
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 14)
                    .background(appTint.gradient, in: .rect(cornerRadius: 50))
                    .contentShape(.rect)
            })
        }
        .padding(15)
    }
    // Point View
    @ViewBuilder
    func PointView(symbol: String, title: String, subTitle: String) -> some View {
        HStack(spacing:20) {
            Image(systemName: symbol)
                .font(.largeTitle)
                .foregroundStyle(appTint.gradient)
                .frame(width: 45)
            VStack(alignment: .leading, spacing: 6, content: {
                Text(title)
                    .font(.title3)
                    .fontWeight(.semibold)
                Text(subTitle)
                    .foregroundStyle(.gray)
            })
        }
    }
}

#Preview {
    IntroScreen()
}
