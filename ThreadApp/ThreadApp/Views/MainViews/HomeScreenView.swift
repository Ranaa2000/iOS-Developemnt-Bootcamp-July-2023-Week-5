//
//  HomeView.swift
//  ThreadApp
//
//  Created by Rana MHD on 07/02/1445 AH.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var UserData: UserDataViewModel

    var body: some View {
        VStack{
            ScrollView{
                ForEach(UserData.post){
                    postData in
                    if let user = UserData.fetchUserById(postData.createdBy){
                        NavigationLink(destination: {
                            PostScreenView(postModel: postData, userModel: user)
                        }, label: {
                            PostComponentView(post: postData, userModel: user)
                        }).buttonStyle(.plain)
                    }
                    
                }
            }
            
        }
    }
    
}
