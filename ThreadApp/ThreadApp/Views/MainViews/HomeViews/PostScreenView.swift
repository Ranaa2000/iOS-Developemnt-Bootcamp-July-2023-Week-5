//
//  PostScreenView.swift
//  ThreadApp
//
//  Created by Rana MHD on 11/02/1445 AH.
//

import SwiftUI

struct PostScreenView: View {
    @State var postModel: Post
    @State var userModel: UserModel
    @EnvironmentObject var userData: UserDataViewModel

    var body: some View {
        ScrollView(showsIndicators: false) {
            PostComponentView(post: postModel, userModel: userModel)
            Divider()
            ForEach(postModel.replay, id: \.self){ postID in
                if let post = userData.fetchPostById(postID) {
                    if let user = userData.fetchUserById(post.createdBy) {
                        PostComponentView(post: post, userModel: user )
                    }
                }
            }
        }
    }
}
