//
//  UIApplication.swift
//  CryptoTracker
//
//  Created by VELJKO on 12.11.22..
//

import Foundation
import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
