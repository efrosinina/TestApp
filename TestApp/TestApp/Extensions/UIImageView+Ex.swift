//
//  UIImageView+Ex.swift
//  TestApp
//
//  Created by Елизавета Ефросинина on 18/08/2023.
//

import UIKit

extension UIImageView {
    func loadImage(stringUrl: String) {
        guard let url = URL(string: stringUrl) else { return }
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
