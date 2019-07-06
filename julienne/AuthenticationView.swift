//
//  AuthenticationView.swift
//  Julienne
//
//  Created by Ben McMahen on 2019-06-18.
//  Copyright © 2019 Ben McMahen. All rights reserved.
//

import SwiftUI

struct SignUpView : View {
    
    @State var email: String = ""
    @State var password: String = ""
    @State var loading = false
    @State var error = false
    
    @EnvironmentObject var session: SessionStore
    
    func signUp () {
        print("sign me up")
        loading = true
        error = false
        session.signUp(email: email, password: password) { (result, error) in
            self.loading = false
            if error != nil {
                print("\(error)")
                self.error = true
            } else {
                self.email = ""
                self.password = ""
            }
        }
    }
    
    var body : some View {
        VStack {
            
            Text("Create an account")
                .font(.title)
                .padding(.horizontal)
            
            CustomInput(text: $email, name: "Email")
                .padding()
            
            VStack(alignment: .leading) {
                SecureField($password, placeholder: Text("Password")).modifier(InputModifier())
                Text("At least 8 characters required.").font(.footnote).color(Color.gray)
                }.padding(.horizontal)
            
            if (error) {
                InlineAlert(
                    title: "Hmm... That didn't work.",
                    subtitle: "Are you sure you don't already have an account with that email address?"
                ).padding([.horizontal, .top])
               
            }
            
            CustomButton(
                label: "Sign up",
                action: signUp
                )
                .disabled(loading)
                .padding()
            
            
            Divider()
            
            Text("An account will allow you to save and access recipe information across devices. You can delete your account at any time and your information will not be shared.")
                .font(.footnote)
                .color(.gray)
                .multilineTextAlignment(.leading)
                .lineLimit(nil)
                .padding()
            
            Spacer()
            
        }
        
    }
    
}

struct SignInView : View {
    
    @State var email: String = ""
    @State var password: String = ""
    @State var loading = false
    @State var error = false
    
    @EnvironmentObject var session: SessionStore
    
    func signIn () {
        loading = true
        error = false
        session.signIn(email: email, password: password) { (result, error) in
            self.loading = false
            if error != nil {
                self.error = true
            } else {
                self.email = ""
                self.password = ""
            }
        }
    }
    
    
    var body: some View {
        
        VStack {
            
            Spacer()
            
            
            Group {
                Image("julienne-logo")
                    .resizable()
                    .frame(width: 75, height: 75)

                Text("Julienne").font(.title).padding(.bottom)

                Text("The easiest way to save, search, and save recipes with family and friends.")
                    .font(.subheadline)
                    .color(.gray)
                    .lineLimit(nil)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
            }

            Spacer()
            
            Group {
                Divider()
               
            
                
                CustomInput(text: $email, name: "Email")
                    .padding()
                
                SecureField("Password", text: $password)
                    .modifier(InputModifier())
                    .padding([.leading, .trailing])

                
                if (error) {
                    InlineAlert(
                        title: "Hmm... That didn't work.",
                        subtitle: "Please check your email and password and try again"
                        ).padding([.horizontal, .top])
                    
                }
                

                
                CustomButton(
                    label: "Sign in",
                    action: signIn,
                    loading: loading
                    )
                    .padding()
                
                
            }
            
            
            
            VStack {
                Divider()
                HStack(alignment: .center) {
                    Text("Don't have an account?")
                        .font(.footnote)
                        .color(.gray)
                    
                  
                    
                    NavigationLink(destination: SignUpView()) {
                        Text("Sign up.").font(.footnote)
                    }
                    }
                    .padding()
            }
            
            
        }
        
    }
}

struct AuthenticationScreen : View {
    
    
    var body : some View {
        NavigationView {
            SignInView()
        }
    }
}


#if DEBUG
struct Authenticate_Previews : PreviewProvider {
    static var previews: some View {
        AuthenticationScreen()
            .environmentObject(SessionStore())
    }
}
#endif
