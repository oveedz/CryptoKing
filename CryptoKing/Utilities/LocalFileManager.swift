//
//  LocalFileManager.swift
//  CryptoKing
//
//  Created by Ovidio  on 9/10/22.
//

import Foundation
import UIKit

//  We use local file manager because xcode has a keyword for file manager
class LocalFileManager {
    static let instance = LocalFileManager()
    
    private init() {}
    
    func saveImage(image: UIImage, imageName: String, folderName: String) {
        createFolderIfNeeded(folderName: folderName)
        
//      get path for image
        guard let data = image.pngData(),
              let url = getUrlForImage(imageName: imageName, folderName: folderName)
        else { return }
        
//      save image to path
        do {
            try data.write(to: url)
        } catch let error {
            print("Error saving image: \(imageName). \(error)")
        }
    }
//  not private because we're gonna call this function from somewhere else in our app
    func getImage(imageName: String, folderName: String) -> UIImage? {
        guard let url = getUrlForImage(imageName: imageName, folderName: folderName),
              FileManager.default.fileExists(atPath: url.path) else {
                  return nil
              }
        return UIImage(contentsOfFile: url.path)
    }
    
//  If the folder does not exist we can create it with this function
    private func createFolderIfNeeded(folderName: String) {
        guard let url = getUrlForFolder(folderName: folderName) else { return }
        
        if !FileManager.default.fileExists(atPath: url.path) {
            do {
                try FileManager.default.createDirectory(at: url, withIntermediateDirectories: true, attributes: nil)
            } catch let error {
                print("Error creating directory. Folder name: \(folderName). \(error)")
            }
        }
    }
    
    private func getUrlForFolder(folderName: String) -> URL? {
        guard let url = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first else {
            return nil
        }
        
        return url.appendingPathComponent(folderName)
    }
    
    private func getUrlForImage(imageName: String, folderName: String) -> URL? {
        guard let folderUrl = getUrlForFolder(folderName: folderName) else { return nil }
        return folderUrl.appendingPathComponent(imageName + ".png")
    }
}




