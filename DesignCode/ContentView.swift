//
//  ContentView.swift
//  DesignCode
//
//  Created by liuyang on 2020/3/27.
//  Copyright © 2020 liuyang. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            VStack {
                Text("UI Design")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color("accent"))
                    .padding(.top)
                Text("Certificate")
                    .foregroundColor(Color.white)
            }
            Image("Background")
        }
        .background(Color.black)
        .cornerRadius(10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
