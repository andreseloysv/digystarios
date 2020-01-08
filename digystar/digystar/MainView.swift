//
//  MainView.swift
//  digystar
//
//  Created by Andres Sanchez Vargas on 08.01.20.
//  Copyright © 2020 digystar. All rights reserved.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        VStack {
            Text("Hello World")
            Button(action:{ fileSystem() }) {
                Text("clickme")
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

func fileSystem() {
    let fm = FileManager.default
    let path = Bundle.main.resourcePath!

    do {
        let items = try fm.contentsOfDirectory(atPath: path)

        for item in items {
            print("Found \(item)")
        }
    } catch {
        // failed to read directory – bad permissions, perhaps?
    }
}

func getDocumentsDirectory() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    let documentsDirectory = paths[0]
    return documentsDirectory
}
