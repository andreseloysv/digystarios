//
//  ContentView.swift
//  digystar
//
//  Created by Andres Sanchez Vargas on 05.01.20.
//  Copyright © 2020 digystar. All rights reserved.
//

import SwiftUI

struct UserAndPassword: View {
  @State var username: String = ""
  @State var password: String = ""
  @State var showingAlert = false
  @State var alertText: String = ""

  var body: some View {
    VStack {
      TextField("Username", text: $username)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .textContentType(.username)
        .autocapitalization(.none)
        .disableAutocorrection(true)

      SecureField("Password", text: $password)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .textContentType(.password)

      Button(action: signInTapped) {
        Text("Log In")
          .foregroundColor(Color.white)
      }
      .alert(isPresented: $showingAlert) {
        Alert(title: Text(alertText))
      }
    }
    .padding()
  }

  private func signInTapped() {
    let ws = CharacterSet.whitespacesAndNewlines

    let account = username.trimmingCharacters(in: ws)
    let pwd = password.trimmingCharacters(in: ws)

    guard !(account.isEmpty || pwd.isEmpty) else {
      alertText = "Please enter a username and password."
      showingAlert = true
      return
    }
    
  }
}

#if DEBUG
struct UserAndPassword_Previews: PreviewProvider {
  static var previews: some View {
    UserAndPassword()
  }
}
#endif
