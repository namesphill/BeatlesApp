//
//  HostingController.swift
//  BeatlesApp
//
//  Created by Felipe Acosta on 10/21/19.
//  Copyright © 2019 Felipe Acosta. All rights reserved.
//

import Foundation
import SwiftUI
import UIKit

class HostingController: UIHostingController<ContentView> {
   override var preferredStatusBarStyle: UIStatusBarStyle {
      return .lightContent
   }
}
