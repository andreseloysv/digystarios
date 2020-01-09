//
//  MainView.swift
//  digystar
//
//  Created by Andres Sanchez Vargas on 08.01.20.
//  Copyright © 2020 digystar. All rights reserved.
//

import SwiftUI

struct MainView: View {
    
    @State var showingImagePicker = false
    @State var image: Image? = nil
    
    var body: some View {
        VStack {
            if image == nil {
                Text("Hello World")
            }
            
            Button(action:{self.showingImagePicker.toggle()}) {
                Text("clickme")
            }
        }.sheet(isPresented: $showingImagePicker,
                content: {
                    ImagePicker.shared.view
        }).onReceive(ImagePicker.shared.$image) {image in
            self.image = image
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
