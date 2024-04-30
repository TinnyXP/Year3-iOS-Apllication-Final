//
//  Home.swift
//  iOS_Final
//
//  Created by DerickS on 30/4/2567 BE.
//

import SwiftUI
import Firebase
struct Home: View {
    @AppStorage("log_status") private var logStatus: Bool = false
    var body: some View {
        NavigationStack {
            Button("Logout") {
                try? Auth.auth().signOut()
                logStatus = false
            }
            .navigationTitle("Home")
        }
    }
}

#Preview {
    Home()
}
