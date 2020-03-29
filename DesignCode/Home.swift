//
//  Home.swift
//  DesignCode
//
//  Created by liuyang on 2020/3/29.
//  Copyright © 2020 liuyang. All rights reserved.
//

import SwiftUI

struct Home: View {
    @State var show = false
    @State var showProfile = false
    var body: some View {
        ZStack {

            ContentView()
                .background(Color.white)
                .cornerRadius(30)
                .shadow(radius: 20)
                .animation(.spring())
                .offset(y: showProfile ? 0 : UIScreen.main.bounds.height)

            VStack {
                HStack {
                    MenuButton(show: self.$show)
                        .offset(x: -30, y: showProfile ? 0 : 80)
                        .animation(.spring())
                    Spacer()
                    MenuRight(show: self.$showProfile)
                        .offset(x: -16, y: showProfile ? 0 : 88)
                        .animation(.spring())
                }
                Spacer()
            }

            MenuView(show: self.$show)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct MenuRow: View {
    var menu: Menu
    var body: some View {
        HStack {
            Image(systemName: menu.icon)
                .imageScale(.large)
                .foregroundColor(Color("icons"))
                .frame(width: 32, height: 32)
            
            Text(menu.title)
                .font(.headline)
            Spacer()
        }
    }
}

/**
 * 菜单数据模型
 */
struct Menu: Identifiable {
    var id = UUID()
    var title: String
    var icon: String
}

let menuData = [
    Menu(title: "My Account", icon: "person.crop.circle"),
    Menu(title: "Billing", icon: "creditcard"),
    Menu(title: "Team", icon: "person.and.person"),
    Menu(title: "Sign out", icon: "arrow.uturn.down")
]


struct MenuView: View {
    var menu = menuData
    @Binding var show: Bool
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ForEach(menu) { item in
                MenuRow(menu: item)
            }
            Spacer()
        }
        .padding(.top, 20)
        .padding(30)
        .frame(minWidth: .zero, maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(30)
        .padding(.trailing, 60)
        .shadow(radius: 20)
        .rotation3DEffect(Angle(degrees: show ? 0: 60), axis: (x: 0, y: 10, z: 0))
        .animation(.spring())
        .offset(x: show ? 0 : -UIScreen.main.bounds.width)
        .onTapGesture {
            self.show.toggle()
        }
    }
}

struct CircleButton: View {
    var icon = "person.crop.circle"
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.black)
        }
        .frame(width: 44, height: 44)
        .background(Color.white)
        .cornerRadius(30)
        .shadow(color: Color("buttonShadow"), radius: 10)
    }
}

struct MenuButton: View {
    @Binding var show: Bool
    var body: some View {
        Button(action: {
            self.show.toggle()
        }) {
            HStack {
                Spacer()
                Image(systemName: "list.dash")
                    .foregroundColor(.black)
            }
            .padding(.trailing, 20)
            .frame(width: 90, height: 60)
            .background(Color.white)
            .cornerRadius(30)
            .shadow(color: Color("buttonShadow"), radius: 10)
        }
    }
}

struct MenuRight: View {
    @Binding var show: Bool
    var body: some View {
        HStack {
            Button(action: {
                self.show.toggle()
            }) {
                CircleButton(icon: "person.crop.circle")
            }
            Button(action: {
                self.show.toggle()
            }) {
                CircleButton(icon: "bell")
            }
        }
    }
}
