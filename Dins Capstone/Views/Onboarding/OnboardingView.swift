//
//  OnboardngView.swift
//  Dins Capstone
//
//  Created by Melissa Nguyen on 8/11/21.
//

import SwiftUI
import Firebase

struct OnboardngView: View {
    
    @EnvironmentObject var model: ContentModel
    @State private var tabSelection = 0
    
    // Login state var
    @State var email = ""
    @State var password = ""
    
    // color variables
    private let blue = Color(red: 0/255, green: 130/255, blue: 167/255)
    private let turquoise = Color(red: 55/255, green: 197/255, blue: 192/255)
    
    // signed in boolean
    let auth = Auth.auth()
    var isSignedIn: Bool {
        return auth.currentUser != nil
    }
    
    var body: some View {
        
        VStack {
            
            // Tab View
            TabView(selection: $tabSelection) {
                
                // First tab
//                VStack (spacing: 20) {
//                    Image("city2")
//                        .resizable()
//                        .scaledToFit()
//                    Text("Welcome to Dins")
//                        .bold()
//                        .font(.title)
//                    Text("City Sights help you find the best of the city")
//                }
//                .multilineTextAlignment(.center)
//                .padding()
//                .foregroundColor(.white)
//                .tag(0)
//
                // First tab - login try
                VStack (spacing: 20) {
                    Spacer()
                    Image("city2")
                        .resizable()
                        .scaledToFit()
                    Text("Can't agree on a place for dinner?")
                    Text("Dins is here to help")
                    Spacer()
                    TextField("Email", text: $email)
                        .padding()
                        .foregroundColor(blue)
                        .background(Color(.secondarySystemBackground))
                        .frame(height: 48)
                        .cornerRadius(10)
                    SecureField("Password", text: $password)
                        .padding()
                        .foregroundColor(blue)
                        .background(Color(.secondarySystemBackground))
                        .frame(height: 48)
                        .cornerRadius(10)
                    Spacer()
                }
                .multilineTextAlignment(.center)
                .padding()
                .foregroundColor(.white)
                .tag(0)
                
                // login tab
//                VStack {
//                    TextField("Email", text: $email)
//                    SecureField("Password", text: $password)
//                }
//                .multilineTextAlignment(.center)
//                .padding()
//                .foregroundColor(.white)
                //
                
                
                
                // Second tab
                VStack (spacing: 20) {
                    Image("city1")
                        .resizable()
                        .scaledToFit()
                    Text("Ready to discover your city?")
                        .bold()
                        .font(.title)
                    Text("We'll show you the best restaurants based on your location")
                }
                .multilineTextAlignment(.center)
                .padding()
                .foregroundColor(.white)
                .tag(1)
                
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            
            // Button
            Button {
                
                // Detect which tab it is
                if tabSelection == 0 {
                    
                    // Create an instance of login func
                    login(email: email, password: password)
                    // uncomment line 114 for now, & move tabSelection = 1 to else conditional of login func
//                    tabSelection = 1
                }
                else {
                    // Request for geolocation permission
                    model.requestGeolocationPermission()
                }
            } label: {
                
                ZStack {
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(height: 48)
                        .cornerRadius(10)
                    
                    Text( tabSelection == 0 ? "Log In / Sign Up": "Get My Location")
                        .bold()
                        .padding()
                }
                 
            }
            .accentColor(tabSelection == 0 ? blue : turquoise)
            .padding()
            Spacer ()
        }
        .background(tabSelection == 0 ? blue : turquoise)
        .ignoresSafeArea()
    }
    
    // MARK: - Login function
    func login (email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil {
                // User did not log in successfully -> needs to signup
                
                if email.isEmpty && password.isEmpty {
                    print("INVALID")
                } else {
                    signUp(email: email, password: password)
                    print(error?.localizedDescription ?? "")
                    print("in login error block")
                }
                
                
               
            } else {
                // User logged in successfully
                // Go to tab 1 (get my location)
                print("success")
                tabSelection = 1
            }
        }
    }
    
    // MARK: - Sign Up function
    func signUp (email: String, password: String) {
        auth.createUser(withEmail: email, password: password) { (result, error) in
            if error != nil {
                // User did not sign up successfully
                print(error?.localizedDescription ?? "")
            }
            // User signed up successfully
            // Go to tab 1 (get my location)
            print("success")
            tabSelection = 1
            
        }
    }
    
}






struct OnboardngView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardngView()
    }
}
