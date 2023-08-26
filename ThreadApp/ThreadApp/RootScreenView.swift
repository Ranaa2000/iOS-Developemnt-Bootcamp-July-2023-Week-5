//
//  RootView.swift
//  ThreadApp
//
//  Created by Rana MHD on 07/02/1445 AH.
//lunchScreen
//make random data
//make random content
//update all headers on main views
//replace users image 

import SwiftUI

struct RootView: View {
    @EnvironmentObject var userPreferences: UserPreferencesViewModel
    @State var showSplash = true

    var body: some View {
        VStack {
            if showSplash {
                Image("Image2")
            } else {
                OnboardingView()
            }
        }
        .onAppear{
            DispatchQueue.main
                .asyncAfter(deadline: .now() + 2) {
                    withAnimation{
                        self.showSplash = false
                    }
                }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
