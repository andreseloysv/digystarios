//
//  ContentView.swift
//  digystar
//
//  Created by Andres Sanchez Vargas on 05.01.20.
//  Copyright © 2020 digystar. All rights reserved.
//

import SwiftUI
import AuthenticationServices

final class SignInWithApple: UIViewRepresentable {
  func makeUIView(context: Context) -> ASAuthorizationAppleIDButton {
    return ASAuthorizationAppleIDButton()
  }
  
  func updateUIView(_ uiView: ASAuthorizationAppleIDButton, context: Context) {
  }
}
