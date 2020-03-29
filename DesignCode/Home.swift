//
//  Home.swift
//  DesignCode
//
//  Created by liuyang on 2020/3/29.
//  Copyright © 2020 liuyang. All rights reserved.
//

import SwiftUI

struct Home: View {
    var menu = menuData
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

