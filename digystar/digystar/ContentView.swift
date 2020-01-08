//
//  ContentView.swift
//  digystar
//
//  Created by Andres Sanchez Vargas on 05.01.20.
//  Copyright © 2020 digystar. All rights reserved.
//


import UIKit
import SwiftUI
import AuthenticationServices

struct ContentView: View {
  @Environment(\.window) var window: UIWindow?
  @State var appleSignInDelegates: SignInWithAppleDelegates! = nil
  @State var isLoggedin = false
    
  var body: some View {
    ZStack {
        if !self.isLoggedin {
             ZStack {
              Color.white.edgesIgnoringSafeArea(.all)
              VStack {
                Image("digystar")
                
                UserAndPassword()
                  .padding()

                SignInWithApple()
                  .frame(width: 280, height: 50)
                  .onTapGesture(perform: showAppleLogin)
  
                NavigationLink(destination: MainView(), isActive: self.$isLoggedin) {
                  Text("hola")
                }.hidden()
              }
            }
            .onAppear {
              //self.performExistingAccountSetupFlows()
            }
        } else {
            MainView()
        }
    }
  }

  private func showAppleLogin() {
    let request = ASAuthorizationAppleIDProvider().createRequest()
    request.requestedScopes = [.fullName, .email]

    performSignIn(using: [request])
  }

  /// Prompts the user if an existing iCloud Keychain credential or Apple ID credential is found.
  private func performExistingAccountSetupFlows() {
    #if !targetEnvironment(simulator)
    // Note that this won't do anything in the simulator.  You need to
    // be on a real device or you'll just get a failure from the call.
    let requests = [
      ASAuthorizationAppleIDProvider().createRequest(),
      ASAuthorizationPasswordProvider().createRequest()
    ]

    performSignIn(using: requests)
    #endif
  }

  private func performSignIn(using requests: [ASAuthorizationRequest]) {
    appleSignInDelegates = SignInWithAppleDelegates(window: window) { success in
      if success {
        print("Login success")
        self.isLoggedin = true
      } else {
        // show the user an error
        let alertController = UIAlertController(title: "iOScreator", message:
            "Error!", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
      }
    }

    let controller = ASAuthorizationController(authorizationRequests: requests)
    controller.delegate = appleSignInDelegates
    controller.presentationContextProvider = appleSignInDelegates

    controller.performRequests()
  }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
#endif
