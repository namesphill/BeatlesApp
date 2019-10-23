//
//  MomentDetail.swift
//  BeatlesApp
//
//  Created by Felipe Acosta on 10/21/19.
//  Copyright © 2019 Felipe Acosta. All rights reserved.
//

import SwiftUI

struct MomentDetail: View {
   var moment: Moment
   @State private var showContent: Bool = true
   var body: some View {
      PullableScrollView(action: {
         self.showContent = !self.showContent
      }) {
         VStack {
            VStack(alignment: .leading) {
               HStack { Spacer() }
               Text(self.moment.name).primaryLabel()
               Text(self.moment.time)
            }.padding()
            Text("“\(self.moment.takeaway)“")
               .font(.headline)
               .italic()
               .bold()
               .padding()
            self.renderContent(content: self.moment.content)
         }
         .colorScheme(.dark)
         .animation(.easeInOut)
         .opacity(self.showContent ? 1 : 0)
      }
      .animation(.easeInOut)
      .background(
         Image(self.moment.imageName)
            .resizable()
            .scaledToFill()
            .clipped()
            .blur(radius: self.showContent ? 5 : 0)
            .overlay(Color(red: 0, green: 0, blue: 0, opacity: self.showContent ? 0.5 : 0))
            .edgesIgnoringSafeArea(.all)
      )
      .statusBar(hidden: !showContent)
      .navigationBarBackButtonHidden(!showContent)
      .onAppear { self.showContent = true }
      .edgesIgnoringSafeArea(.all)
   }

   private func renderContent(content: [[String]]) -> some View {
      VStack {
         ForEach(0 ..< content.count) { paragraph in
            VStack {
               ForEach(0 ..< content[paragraph].count) { line in
                  VStack {
                     Text("\(content[paragraph][line])")
                  }
               }
            }.padding()
         }
      }
   }
}

struct MomentDetail_Previews: PreviewProvider {
   static var previews: some View {
      MomentDetail(moment: John.moments.last!)
   }
}
