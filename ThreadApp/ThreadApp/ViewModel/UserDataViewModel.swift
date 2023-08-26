//
//  UserDataViewModel.swift
//  ThreadApp
//
//  Created by Rana MHD on 11/02/1445 AH.
//

import Foundation

class UserDataViewModel: ObservableObject {
    @Published var post: Array <Post> = []
    @Published var users: Array <UserModel> = []
    
    init(){
        let maxUsers = 100
        for _ in 0..<maxUsers {
            let  firstandlastname = makeRandomFullName()
            let fullname = "\(firstandlastname)"
            let username = "\(firstandlastname[0])".lowercased()
            let user = UserModel(userName: username,
                                 fullName: fullname,
                                 bio: "Randome bio!",
                                 image: URL(string: "https://source.unsplash.com/300x400/?person")!,
                                 followers: [],
                                 following: [],
                                 posts: [])
            users.append(user)
        }

        let maxPosts = maxUsers * 5
        for _ in 0..<maxPosts {
            let userId = users.randomElement()!.id
            let postData = Post(createdBy: userId, content: makeRandomContent(),
                                createdAt: Date(), attachment: makeRandomAttachments(),
                                replay: [],
                                likes:[])
            
            post.append(postData)

            let index = users.firstIndex(where: { user in
                user.id == userId
            })

            if let index = index {
                users[index].posts.append(postData.id)
            }
        }
    
        for _ in 0..<(maxUsers * 2) {
            let user1 = users.indices.randomElement()!
            let user2 = users.indices.randomElement()!
            if user1 != user2 {
                users [user1].following.append(users[user2].id)
                users[user2].followers.append(users[user1].id)
            }
        }
        
        
    }
    
    func fetchPost() {
        let numberOfPost = Int.random(in: 3...10)
        
        var _post:  Array <Post> = []
        
        for _ in 0...numberOfPost {
            let arraypost = Post(createdBy: UUID() , content: makeRandomContent(),
                                 createdAt: Date(), attachment: makeRandomAttachments(), replay: [], likes:[])
            
            
            _post.append(arraypost)
            
        }
        post = _post
        //
    }

    func  makeRandomFullName() -> Array<String>{
        let username = """
        Abdulrahman
        Mohammed
        Rana
        Ali
        Abdullah
        Noor
        Saeed
        Fatima
        Abdulrahman
        Mohammed
        Rana
        Ali
        Abdullah
        Noor
        Saeed
        """.components(separatedBy: "\n")
     
        return username.randomElement()!.components(separatedBy: " ")
    }

    func makeRandomContent() -> Optional<String> {
        let shouldContainContent = Bool.random()
        if shouldContainContent{
            return "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable."
        }
        else{
            return ""
        }
    }

    func makeRandomAttachments() -> Array<URL> {
        let numberOfImage = Int.random(in: 0...5)
        var arrayOfURL =  Array<URL>()
        for _ in 0...numberOfImage{
            arrayOfURL.append( URL(string: "https://source.unsplash.com/40x40/?person")!)
        }
        return arrayOfURL
    }

    func fetchUserById(_ userID: UserModel.ID) -> Optional<UserModel> {
        let index = users.firstIndex(where: { user in
            user.id == userID
        } )
        if let index = index {
            return users[index]
        } else {
            return nil
        }
    }

    func fetchPostById(_ postId: Post.ID) -> Optional<Post> {
        let index = post.firstIndex(where: { post in
            post.id == postId})
        if let index = index {
            return post[index]
        }
        return nil
    }
}
