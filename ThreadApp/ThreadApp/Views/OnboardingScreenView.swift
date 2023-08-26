//
//  OnboardingView.swift
//  ThreadApp
//
//  Created by Rana MHD on 07/02/1445 AH.
//

import SwiftUI

enum CurrentPresentView{
    case authentication
    case mainView
}

struct OnboardingView: View {
    @State var presentView: CurrentPresentView = .authentication
    @EnvironmentObject var auth: AuthViewModel
    @EnvironmentObject var userData : UserDataViewModel

    var body: some View {
        switch presentView {
        case .authentication:
            VStack{
                Image("Image1")
                    .resizable()
                    .scaledToFit()
                Spacer()
                Button(action: {
                    if auth.signIn(userData.users.randomElement()!.id)
                    {
                        presentView = .mainView
                    }
                }, label:  {
                    Text("Log in")
                        .foregroundColor(.black)
                })
                .frame(width: 300, height: 50)
                .background(.gray)
                    .padding()
            }
        case .mainView:
            MainView()
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
