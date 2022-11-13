//
//  LocalFileManager.swift
//  CryptoTracker
//
//  Created by VELJKO on 12.11.22..
//

import Foundation
import SwiftUI

class LocalFileManager {
    
    static let shared = LocalFileManager()
    
    private init() { }
    
    // MARK: - Create Folder for Image
    private func createFolderIfNeeded(folderName: String) {
        guard let url = getURLForFolder(folderName: folderName) else { return }
        if !FileManager.default.fileExists(atPath: url.path) {
            do {
                try FileManager.default.createDirectory(at: url, withIntermediateDirectories: true)
            } catch let error {
                print("Error creating directory. FolderName: \(folderName). \(error)")
            }
        }
    }
    
    // MARK: - Save Image to Folder
    func saveImage(image: UIImage, imageName: String, folderName: String) {
        // Create Folder
        createFolderIfNeeded(folderName: folderName)
        
        // Get Path for Image
        guard let data = image.pngData(),
              let url = getURLForImage(imageName: imageName, folderName: folderName)
              else { return }
        
        // Save image to path
        do {
            try data.write(to: url)
        } catch let error {
            print("Error saving image. ImageName: \(imageName). \(error)")
        }
    }
    
    // MARK: - Get Image from Folder
    func getImage(imageName: String, folderName: String) -> UIImage? {
        guard let url = getURLForImage(imageName: imageName, folderName: folderName),
              FileManager.default.fileExists(atPath: url.path) else { return nil }
        return UIImage(contentsOfFile: url.path)
    }
}

// MARK: - URLs
extension LocalFileManager {
    // MARK: - Get URL For Folder
    private func getURLForFolder(folderName: String) -> URL? {
        guard let url = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first else { return nil }
        return url.appendingPathExtension(folderName)
    }
    
    // MARK: - Get URL For Image
    private func getURLForImage(imageName: String, folderName: String) -> URL? {
        guard let folderURL = getURLForFolder(folderName: folderName) else { return nil }
        return folderURL.appendingPathExtension(imageName + ".png")
    }
}
