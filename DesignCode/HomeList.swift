//
//  HomeList.swift
//  DesignCode
//
//  Created by liuyang on 2020/3/29.
//  Copyright © 2020 liuyang. All rights reserved.
//

import SwiftUI

struct HomeList: View {
    @State var showCourseContent = false
    var body: some View {
        ZStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 30) {
                    ForEach(coursesData) { course in
                        Button(action: {
                            self.showCourseContent.toggle()
                        }) {
                            CourseView(course: course)
                        }
                        .sheet(isPresented: self.$showCourseContent) {
                            ContentView()
                        }
                    }
                }.padding(.leading, 30)
            }
        }
    }
}

struct HomeList_Previews: PreviewProvider {
    static var previews: some View {
        HomeList()
    }
}

struct CourseView : View {
    var course: Course
    var body: some View {
        VStack(alignment: .leading) {
            Text(course.title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(20)
                .lineLimit(4)
                .padding(.trailing, 50)
            Spacer()
            Image(course.image)
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fit)
                .frame(width: 246, height: 150)
                .padding(.bottom, 30)
        }
        .background(course.color)
        .cornerRadius(30)
        .frame(width: 246, height: 360)
        .shadow(color: course.shadowColor, radius: 20, x: 0, y: 20)
    }
}

struct Course: Identifiable {
    var id = UUID()
    var title: String
    var image: String
    var color: Color
    var shadowColor: Color
}

let coursesData = [
    Course(title: "Build an app with SwiftUI",
           image: "Illustration1",
           color: Color("background3"),
           shadowColor: Color("bacgroundShadow3")),
           Course(title: "Design Course",
                  image: "Illustration2",
                  color: Color("background4"),
                  shadowColor: Color("bacgroundShadow4"))
]

