//
//  ContentView.swift
//  iOS_Final
//
//  Created by Trin Pongsri on 1/4/2567 BE.
//

import SwiftUI

struct ContentView: View {
    // Visibility Status
    @AppStorage("isFirstTime") private var isFirstTime: Bool = true
    // Active Tab
    @State private var activeTab: Tab = .recents
    
    // All Tab's
    @State private var allTabs: [AnimatedTab] = Tab.allCases.compactMap { tab -> AnimatedTab? in
        return .init(tab: tab)
    }
    // Bounce Property
    @State private var bouncesDown: Bool = true
    
    var body: some View {
        DarkModeWrapper {
            VStack(spacing: 0) {
                TabView(selection: $activeTab) {
                    /// YOUR TAB VIEWS
                    NavigationStack {
                        Recents()
                    }
                    .setUpTab(.recents)
                    
                    NavigationStack {
                        Search()
                    }
                    .setUpTab(.search)
                    
                    NavigationStack {
                        Graphs()
                    }
                    .setUpTab(.charts)
                    
                    NavigationStack {
                        AllApps()
                    }
                    .setUpTab(.allapps)
                    
                    NavigationStack {
                        Settings()
                    }
                    .setUpTab(.settings)
                }
                CustomTabBar()
            }
        }
    }
    
    /// Custom Tab Bar
    @available(macOS 14.0, *)
    @ViewBuilder
    func CustomTabBar() -> some View {
        HStack(spacing: 0) {
            ForEach($allTabs) { $animatedTab in
                let tab = animatedTab.tab
                
                VStack(spacing: 4) {
                    VStack {
                        Image(systemName: tab.rawValue)
                            .font(.title2)
                            .symbolEffect(.bounce.down.byLayer, value: animatedTab.isAnimating)
                            .frame(width: 10, height: 10)
                    }
                    .padding(.top, 6.0)
                    .padding(.bottom, 5.0)
                    
                    if #available(macOS 14.0, *) {
                        Text(tab.title)
                            .font(.caption)
                            .textScale(.secondary)
                    } else {
                        // Fallback on earlier versions
                    }
                }
                .frame(maxWidth: .infinity)
                .foregroundStyle(activeTab == tab ? Color.blue : Color.gray.opacity(0.8))
                .padding(.top, 10)
                .padding(.bottom, 2)
                .contentShape(.rect)
                /// You Can Also Use Button, If you Choose to
                .onTapGesture {
                    withAnimation(.bouncy, completionCriteria: .logicallyComplete, {
                        activeTab = tab
                        animatedTab.isAnimating = true
                    }, completion: {
                        var trasnaction = Transaction()
                        trasnaction.disablesAnimations = true
                        withTransaction(trasnaction) {
                            animatedTab.isAnimating = nil
                        }
                    })
                }
            }
        }
        .background(.bar)
    }
}

#Preview {
    ContentView()
}

extension View {
    @ViewBuilder
    func setUpTab(_ tab: Tab) -> some View {
        self
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .tag(tab)
    }
}

//struct ContentView: View {
//    // Visibility Status
//    @AppStorage("isFirstTime") private var isFirstTime: Bool = true
//    // Active Tab
//    @State private var activeTab: Tab = .recents
//    var body: some View {
//        TabView(selection: $activeTab) {
//            Recents()
//                .tag(Tab.recents)
//                .tabItem {Tab.recents.tabContent
//                        .symbolVariant(.fill)
//                }
//            Search()
//                .tag(Tab.search)
//                .tabItem { Tab.search.tabContent }
//            Graphs()
//                .tag(Tab.charts)
//                .tabItem { Tab.charts.tabContent }
//            Settings()
//                .tag(Tab.settings)
//                .tabItem { Tab.settings.tabContent }
//        }
//        .sheet(isPresented: $isFirstTime, content: {
//            IntroScreen()
//                .interactiveDismissDisabled()
//        })
//    }
//}
//
//#Preview {
//    ContentView()
//}
