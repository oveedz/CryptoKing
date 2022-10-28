//
//  LogInView.swift
//  CryptoKing
//
//  Created by Ovidio  on 10/16/22.
//

import SwiftUI
import UIKit

struct LoginView: View {
    @EnvironmentObject var vm: HomeViewModel
    @State var isShowingLoginPage: Bool = true

    var body: some View {
//      background v stack
            VStack(spacing: 20) {
    //          content v stack
                VStack(spacing: 30) {
                    
                    HStack{
                        Spacer()
                        XmarkView()
                    }
                    
                    header
                    
                    if !isShowingLoginPage {
                        imagePicker
                    }
                    
                    userTextFields
                    
                    VStack(spacing: 10) {
                        Button {
                            if isShowingLoginPage {
                                vm.signInWithEmail()
                            } else {
                                vm.signUpWithEmail()
                            }
                        } label: {
                            PrimaryButtonView(buttonTitle: isShowingLoginPage ? "Log in": "Create account")
                        }
                                
                        Text(vm.loginUpdateMessage)
                            .font(.headline)
                            .foregroundColor(.red)
                            .fontWeight(.semibold)

                        
                        accountButton
                    }
                    
                    Spacer()

                }
                .padding(40)

            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea()
            .background(Color.theme.background)
            .sheet(isPresented: $vm.isShowingImagePicker) {
                ImagePicker(image: $vm.profileImage)
            }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    private var header: some View {
        VStack(alignment: .leading) {
            Text(isShowingLoginPage ? "Log in" : "Create account")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(Color.theme.accent)
            Text(isShowingLoginPage ? "Welcome back":"Let's get started")
                .font(.subheadline)
                .foregroundColor(Color.white)

        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .frame(height: 50)
    }
    
    private var imagePicker: some View {
        Button {
            vm.isShowingImagePicker.toggle()
        } label: {
            if let image = vm.profileImage {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 150, height: 150)
                    .cornerRadius(75)
                    .overlay {
                        Circle()
                            .stroke(lineWidth: 3)
                            .fill(Color.theme.accent)
                    }

            } else {
                Image(systemName: "person.crop.circle.fill.badge.plus")
                    .foregroundColor(Color.theme.accent)
                    .font(.system(size: 80, weight: .light, design: .rounded))
            }
        }
    }
    
    private var userTextFields: some View {
        VStack(spacing: 20) {
            if isShowingLoginPage == false {
                HStack {
                    TextFieldView(keyboardType: .emailAddress,
                                  text: $vm.name,
                                  textPrompt: Text("Name"))
                    
                }
            }
            
            HStack {
                TextFieldView(keyboardType: .emailAddress,
                              text: $vm.email,
                              textPrompt: Text("Email"))
                
            }
            SecureField("", text: $vm.password, prompt: Text("Password"))
                .frame(maxWidth: .infinity)
                .frame(height: 20)
                .padding()
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 0.5)
                        .fill(Color.theme.accent)
                }
        }
        .foregroundColor(.white)
    }
    
    private var accountButton: some View {
        VStack(spacing: 2) {
            Text(isShowingLoginPage ? "Don't have an account?" : "Already have an account?")
                .foregroundColor(.white)
                .font(.caption2)

            Button {
                withAnimation(.spring()) {
                    isShowingLoginPage.toggle()
                    vm.loginUpdateMessage = ""
                }
                
            } label: {
                Text(isShowingLoginPage ? "Sign up" : "Log in")
                    .foregroundColor(.blue)
                    .bold()
                    .font(.caption)
            }
            
        }
    }
}


struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
//            .preferredColorScheme(.dark)
            .environmentObject(dev.homeVM)
    }
}
