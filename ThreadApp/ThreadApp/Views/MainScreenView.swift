//
//  MainView.swift
//  ThreadApp
//
//  Created by Rana MHD on 07/02/1445 AH.
//

import SwiftUI

struct MainView: View {
    var body: some View {
       
        TabView{
            
            HomeView()
                    .tabItem{
                    Image(systemName: "house")
                       
                    }
            SearchView()
                    .tabItem{
                    Image(systemName: "magnifyingglass")
                        
                    }
            NewPostView()
                    .tabItem{
                    Image(systemName: "square.and.pencil")
                        
                    }
            ActivityView()
                    .tabItem{
                    Image(systemName: "suit.heart")
                        
                    }
            ProfileView()
                    .tabItem{
                    Image(systemName: "person")
                       
                    }
      
        }
    }
}
