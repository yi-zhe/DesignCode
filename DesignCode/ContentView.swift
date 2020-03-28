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
        ZStack {
            VStack {
                Text("Card Back")

            }
            .frame(width: 300, height: 220)
            .background(Color.blue)
            .cornerRadius(10)
            .shadow(radius: 20)
            .offset(y: -20)

            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text("UI Design")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(Color("accent"))
                            .padding(.top)
                        Text("Certificate")
                            .foregroundColor(Color.white)
                    }
                    Spacer()
                    Image("Logo")
                        .resizable()
                        .frame(width: 30, height: 30)
                }
                .padding(.horizontal)
                Spacer()
                Image("Background")
            }
            .background(Color.black)
            .cornerRadius(10)
            .frame(width: 340, height: 220)
            .shadow(radius: 20)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
