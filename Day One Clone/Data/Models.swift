//
//  Models.swift
//  Day One Clone
//
//  Created by Polina Fiksson on 5/29/18.
//  Copyright © 2018 PolinaFiksson. All rights reserved.
//

import Foundation
import RealmSwift
import Toucan

class Entry: Object {
    @objc dynamic var text = ""
    @objc dynamic var date = Date()
    let pictures = List<Picture>()

}

class Picture: Object {
    @objc dynamic var fullImageName = ""
    @objc dynamic var thumbnailName = ""
    @objc dynamic var entry: Entry?

    convenience init(image:UIImage) {
        self.init()
        fullImageName = imageToURLString(image: image)
        if let smallImage = Toucan(image: image).resize(CGSize(width: 500, height: 500), fitMode: .crop).image {
            thumbnailName = imageToURLString(image: smallImage)
        }
    }

    func fullImage() -> UIImage {
        return imageFromFileName(fileName: fullImageName)

    }

    func thumbnail() -> UIImage {
        return imageFromFileName(fileName: thumbnailName)
    }

    func imageFromFileName(fileName: String) -> UIImage {
        var path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        path.appendPathComponent(fileName)
        if let imageData = try? Data(contentsOf: path) {
            if let image = UIImage(data: imageData) {
                return image
            }
        }
        return UIImage()
    }

    func imageToURLString(image: UIImage) -> String {
        if let imageData = UIImagePNGRepresentation(image) {
            let fileName = UUID().uuidString + ".png"
            var path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            path.appendPathComponent(fileName)
            try? imageData.write(to: path)
            return fileName

        }
        return ""
    }
}
