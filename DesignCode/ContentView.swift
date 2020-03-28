//
//  ContentView.swift
//  DesignCode
//
//  Created by liuyang on 2020/3/27.
//  Copyright © 2020 liuyang. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var show = false
    var body: some View {
        ZStack {
            TitleView()
                .blur(radius: show ? 20 : 0)
                .animation(.default)

            CardBottomView()
                .blur(radius: show ? 20 : 0)
                .animation(.default)

            CardView()
                .background(show ? Color.red : Color("background9"))
                .cornerRadius(10)
                .shadow(radius: 20)
                .offset(y: show ? -400 : -40)
                .scaleEffect(0.85)
                .rotationEffect(Angle(degrees: show ? 15 : 0))
                //                .rotation3DEffect(Angle(degrees: show ? 50 : 0), axis: (x: 10, y: 10, z: 10))
                .animation(.easeInOut(duration: 0.7))
                .blendMode(.hardLight)

            CardView()
                .background(show ? Color.red : Color("background8"))
                .cornerRadius(10)
                .shadow(radius: 20)
                .offset(y: show ? -200 : -20)
                .scaleEffect(0.9)
                .rotationEffect(Angle(degrees: show ? 10 : 0))
                //                .rotation3DEffect(Angle(degrees: show ? 40 : 0), axis: (x: 10, y: 10, z: 10))
                .animation(.easeInOut(duration: 0.5))
                .blendMode(.hardLight)

            CertificateView()
                .scaleEffect(0.95)
                .rotationEffect(Angle(degrees: show ? 5 : 0))
                //                .rotation3DEffect(Angle(degrees: show ? 30 : 0), axis: (x: 10, y: 10, z: 10))
                .animation(.interpolatingSpring(mass: 1, stiffness: 100, damping: 10, initialVelocity: 0))
                .onTapGesture {
                    self.show.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CardView: View {
    var body: some View {
        VStack {
            Text("Card Back")
        }
        .frame(width: 340, height: 220)
    }
}

struct CertificateView: View {
    var body: some View {
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

struct TitleView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Certificates")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                Spacer()
            }
            Image("Illustration5")
            Spacer()
        }.padding()
    }
}

struct CardBottomView: View {
    var body: some View {
        VStack(spacing: 20) {
            Rectangle()
                .frame(width: 60, height: 6)
                .cornerRadius(3)
                .opacity(0.1)
            Text("This certificate is proof that Meng To has achieved the UI Design course with approval from a Design+Code instructor.")
                .lineLimit(10)
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .padding()
        .padding(.horizontal)
        .background(Color.white)
        .cornerRadius(30)
        .shadow(radius: 20)
        .offset(y: 600)
    }
}
