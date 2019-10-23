//
//  Artist.swift
//  HelloWorld
//
//  Created by Felipe Acosta on 10/21/19.
//  Copyright © 2019 Felipe Acosta. All rights reserved.
//

import Foundation

struct Moment: Hashable, Codable, Identifiable {
   var name: String
   var id: String
   var imageName: String
   var content: [[String]]
   var time: String
   var takeaway: String
}

struct Artist: Hashable, Codable, Identifiable {
   var id: String
   var name: String
   var imageName: String
   var bio: [String]
   var moments: [Moment]
}

let Paul = Artist(
   id: "paulmccartney",
   name: "Paul",
   imageName: "paul",
   bio: ["Paul McCartney was a good boy.", "He was called Macca by his friends."],
   moments: [
      Moment(name: "Let it Be", id: "letitbe", imageName: "letitbe", content: [
         [
            "When I find myself in times of trouble, Mother Mary comes to me",
            "Speaking words of wisdom, “let it be”",
            "And in my hour of darkness, she is standing right in front of me",
            "Speaking words of wisdom, “let it be”"
         ],
         [
            "Let it be, let it be",
            "Let it be, let it be",
            "Whisper words of wisdom",
            "Let it be"
         ]
      ], time: "March, 1970", takeaway: "Mother Mary comes to me")
   ])

let John = Artist(
   id: "johnlennon",
   name: "John",
   imageName: "john",
   bio: ["John Lennon's mother died.", "He married Yoko Ono one day."],
   moments: [
      Moment(name: "Dig a Pony", id: "digapony", imageName: "digapony", content: [
         [
            "I dig a pony",
            "Well, you can celebrate anything you want",
            "Yes, you can celebrate anything you want",
            "Oh!"
         ],
         [
            "I do a road hog",
            "Well, you can penetrate any place you go",
            "Yes, you can penetrate any place you go"
         ],
         [
            "I told you so, all I want is you",
            "Everything has got to be just like you want it to",
            "Because"
         ]
      ], time: "January, 1969", takeaway: "Well, you can penetrate any place you go"),
      Moment(name: "Bed-ins for Peace", id: "bedins", imageName: "bedins", content: [
         [
            "I dig a pony",
            "Well, you can celebrate anything you want",
            "Yes, you can celebrate anything you want",
            "Oh!",
            "I do a road hog",
            "Well, you can penetrate any place you go",
            "Yes, you can penetrate any place you go"
         ],
         [
            "I told you so, all I want is you",
            "Everything has got to be just like you want it to",
            "Because"
         ]
      ], time: "March, 1969", takeaway: "Mother Mary comes to me")
   ])
