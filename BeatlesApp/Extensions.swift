//
//  Extensions.swift
//  HelloWorld
//
//  Created by Felipe Acosta on 10/21/19.
//  Copyright © 2019 Felipe Acosta. All rights reserved.
//

import Foundation
import SwiftUI

extension Text {
   func primaryLabel() -> some View {
      return self
         .bold()
         .font(.largeTitle)
   }
}

extension View {
   func darkOverlay() -> some View {
      let almostBlack = Color(red: 0, green: 0, blue: 0, opacity: 0.5)
      return self.overlay(
         LinearGradient(
            gradient: Gradient(
               stops:
               [
                  Gradient.Stop(color: .black, location: 0),
                  Gradient.Stop(color: almostBlack, location: 0.2),
                  Gradient.Stop(color: .clear, location: 0.6),
                  Gradient.Stop(color: .black, location: 0.9)
               ]
            ),
            startPoint: .top,
            endPoint: .bottom
         )
      )
   }
}

extension ScrollView {
   func onPull(minOffset: CGFloat = 0, action: @escaping () -> Void) -> some View {
      return PullableScrollView(minOffset: minOffset, action: { action() }) {
         VStack {
            self.content
         }
      }
   }
}

extension View {
   func clippedTo(
      height: CGFloat = .infinity,
      width: CGFloat = .infinity
   ) -> some View {
      return self.aspectRatio(contentMode: ContentMode.fill)
         .frame(
            maxWidth: width,
            maxHeight: height,
            alignment: Alignment.top
         )
         .clipped()
   }
}

extension Image {
   func fillingImage(
      maxHeight: CGFloat = .infinity,
      maxWidth: CGFloat = .infinity
   ) -> some View {
      return self
         .resizable()
         .clippedTo(height: maxHeight, width: maxWidth)
         .clipped()
   }
}

extension View {
   func descriptionOverlay<Overlay>(_ overlay: Overlay, alignment: Alignment = .bottomLeading)
      -> some View where Overlay: View {
      return ZStack(alignment: alignment) {
         self
         overlay
      }
   }
}
