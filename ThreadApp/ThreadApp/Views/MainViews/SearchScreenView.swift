//
//  SearchView.swift
//  ThreadApp
//
//  Created by Rana MHD on 07/02/1445 AH.
//

import SwiftUI

struct SearchView: View {
    @State var searchedText : String = ""
    var body: some View {
        NavigationView{
            VStack{
                //Search field
                HStack{
                    Image(systemName: "magnifyingglass")
                    TextField("Search", text: $searchedText)
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12.5)
                        .fill(.gray.opacity(0.25))
                )
                .frame(height:50)
                .padding(.horizontal)
                // people to follow
                ScrollView{
                    HStack(alignment: .top){
                        Image(systemName: "swift")
                        VStack(alignment : .leading){
                            Text("User name")
                            Text("First,last names")
                            Text("21 followers")
                        }
                        .frame(maxWidth : .infinity , alignment : .leading )
                      
                        Button {
                            
                        } label: {
                            Text("Follow")
                                .padding(.horizontal , 16)
                                .padding(.vertical ,8)
                                .background(
                                    RoundedRectangle(cornerRadius: 12.5)
                                        .stroke(.gray .opacity(0.25))
                                )
                        }
                        .buttonStyle(.plain)
                    }
                    .padding(.horizontal)
                }
            }
            .navigationTitle("Search")
        }
    }
}
struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
