//
//  UIImageView+Utils.swift
//  MiniProjet
//
//  Created by Karim BEN-HAMMOUDA on 27/03/2021.
//

import UIKit

extension UIImageView {
    func downloadImage(_ url: URL, _ imageView: UIImageView) {
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async() {
            let str = String(decoding: data, as: UTF8.self)
                if str == "404: Not Found" {
                    imageView.image = UIImage(named: "logo")
                } else {
                    imageView.image = UIImage(data: data)
                }
            }
        }
    }
}
