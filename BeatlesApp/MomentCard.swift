//
//  ArtistMoment.swift
//  BeatlesApp
//
//  Created by Felipe Acosta on 10/21/19.
//  Copyright © 2019 Felipe Acosta. All rights reserved.
//

import SwiftUI

struct MomentCard: View {
   var moment: Moment
   var body: some View {
      Image(moment.imageName)
         .renderingMode(.original)
         .fillingImage(maxHeight: 300)
         .overlay(Color(red: 0, green: 0, blue: 0, opacity: 0.2))
         .descriptionOverlay(
            VStack(alignment: .leading) {
               Text(moment.name).font(.title)
               Text(moment.time).font(.footnote)
            }.padding().foregroundColor(.white)
         )
         .cornerRadius(10)
         .padding()
   }
}

struct ArtistMoment_Previews: PreviewProvider {
   static var previews: some View {
      MomentCard(moment: Paul.moments.first!)
   }
}
