//
//  ContentView.swift
//  digystar
//
//  Created by Andres Sanchez Vargas on 05.01.20.
//  Copyright © 2020 digystar. All rights reserved.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder {
  var window: UIWindow?
}

extension SceneDelegate: UIWindowSceneDelegate {
  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let windowScene = scene as? UIWindowScene else { return }
    
    let window = UIWindow(windowScene: windowScene)

    let rootView = ContentView().environment(\.window, window)
    
    window.rootViewController = UIHostingController(rootView: rootView)
    self.window = window
    window.makeKeyAndVisible()
  }
}
