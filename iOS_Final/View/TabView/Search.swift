//
//  Search.swift
//  iOS_Final
//
//  Created by Trin Pongsri on 2/4/2567 BE.
//

import SwiftUI

struct Search: View {
    var body: some View {
        GeometryReader {
            let size = $0.size
            
            NavigationStack {
                ScrollView(.vertical) {
                    LazyVStack(spacing: 10, pinnedViews: [.sectionHeaders]) {
                        Section {
                            
                        } header: {
                            HeaderView(size)
                        }
                    }
                    .padding(15)
                }
            }
        }
    }
    @ViewBuilder
    func HeaderView(_ size: CGSize) -> some View {
        VStack(alignment: .leading, spacing: 5, content: {
            Text("Search")
                .font(.title.bold())
        })
        .hSpacing(.leading)
        .background {
            Rectangle()
                .fill(.bar)
                .padding(.horizontal, -15)
                .padding(.top, -(safeArea.top + 15))
                .padding(.bottom, -15)
            
        }
    }
}


#Preview {
    ContentView()
}
