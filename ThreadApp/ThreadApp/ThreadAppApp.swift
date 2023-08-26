//
//  ThreadAppApp.swift
//  ThreadApp
//
//  Created by Rana MHD on 07/02/1445 AH.
//

import SwiftUI

@main
struct ThreadAppApp: App {
    @ObservedObject var userPreferences = UserPreferencesViewModel()
    @ObservedObject var auth = AuthViewModel()
    @ObservedObject var post = UserDataViewModel()
    
    init () {
        auth.reset()
    }

    var body: some Scene {
        WindowGroup {
            RootView().environmentObject(userPreferences)
            .environmentObject(auth).environmentObject(post)
        }
    }
}
