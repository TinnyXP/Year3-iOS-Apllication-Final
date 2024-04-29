//
//  Tab.swift
//  iOS_Final
//
//  Created by Trin Pongsri on 1/4/2567 BE.
//

import SwiftUI

/// Tab's
enum Tab: String, CaseIterable {
    case recents = "calendar"
    case search = "sparkle.magnifyingglass"
    case charts = "chart.bar.xaxis"
    case allapps = "square.stack.3d.up.fill"
    case settings = "gearshape.fill"
    
    var title: String {
        switch self {
        case .recents:
            return "Recents"
        case .search :
            return "Search"
        case .charts:
            return "Charts"
        case .allapps:
            return "All Apps"
        case .settings:
            return "Settings"
        }
    }
}

/// Animated SF Tab Model
struct AnimatedTab: Identifiable {
    var id: UUID = .init()
    var tab: Tab
    var isAnimating: Bool?
}

//enum Tab: String, CaseIterable {
//    case recents = "Recents"
//    case search = "Filter"
//    case charts = "Charts"
//    case settings = "Settings"
//    
//    @ViewBuilder
//    var tabContent: some View {
//        switch self {
//        case .recents:
//            Image(systemName:"calendar")
//            Text(self.rawValue)
//        case .search:
//            Image(systemName: "magnifyingglass")
//            Text(self.rawValue)
//        case .charts:
//            Image(systemName: "chart.bar.xaxis")
//            Text(self.rawValue)
//        case .settings:
//            Image(systemName: "gearshape")
//            Text(self.rawValue)
//        }
//    }
//}
