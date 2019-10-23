//
//  PullableScrollView.swift
//  BeatlesApp
//
//  Created by Felipe Acosta on 10/23/19.
//  Copyright © 2019 Felipe Acosta. All rights reserved.
//

import SwiftUI

struct RefreshableKeyTypes {
   struct PrefData: Equatable {
      let bounds: CGRect
   }

   struct PrefKey: PreferenceKey {
      static var defaultValue: [PrefData] = []

      static func reduce(value: inout [PrefData], nextValue: () -> [PrefData]) {
         value.append(contentsOf: nextValue())
      }

      typealias Value = [PrefData]
   }
}

struct PullableScrollView<Content: View>: View {
   @State private var showRefreshView: Bool = false
   @State private var pullStatus: CGFloat = 0

   private var minOffset: CGFloat = 0

   let action: () -> Void
   let content: () -> Content

   init(
      minOffset: CGFloat = 0,
      action: @escaping () -> Void,
      @ViewBuilder content: @escaping () -> Content
   ) {
      self.minOffset = minOffset
      self.action = action
      self.content = content
   }

   public var body: some View {
      ScrollView {
         GeometryReader { geometry in
            Rectangle()
               .opacity(0)
               .preference(
                  key: RefreshableKeyTypes.PrefKey.self,
                  value: [
                     RefreshableKeyTypes.PrefData(bounds: geometry.frame(in: CoordinateSpace.global))
                  ]
               )
               .offset(x: 0, y: -90)
         }.animation(.easeIn)
         content()
      }
      .onPreferenceChange(RefreshableKeyTypes.PrefKey.self) { values in
         guard let bounds = values.first?.bounds else { return }
         self.pullStatus = CGFloat((bounds.origin.y - 106) / 80)
         self.refresh(offset: bounds.origin.y)
      }
   }

   func refresh(offset: CGFloat) {
      if offset > (100 + minOffset), showRefreshView == false {
         showRefreshView = true
         DispatchQueue.main.async {
            self.action()
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
               self.showRefreshView = false
            }
         }
      }
   }
}

struct PullableScrollViewExample: View {
   @State private var scheme: Bool = true
   public var body: some View {
      PullableScrollView(action: { self.scheme = !self.scheme }) {
         ForEach(0 ..< 20) { _ in
            Text("Pull to change background color")
               .font(.title)
               .foregroundColor(.white)
         }
      }.background(scheme ? Color.blue : Color.pink)
   }
}

struct PullableScrollView_Previews: PreviewProvider {
   static var previews: some View {
      PullableScrollViewExample()
   }
}
