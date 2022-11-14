//
//  String.swift
//  CryptoTracker
//
//  Created by VELJKO on 14.11.22..
//

import Foundation

extension String {
    
    var removingHTMLOccurances: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression)
    }
}
