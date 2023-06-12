//
//  UIImageView+Extension.swift
//  ProteinCodeChallange
//
//  Created by Oğuzhan Kabul on 13.06.2023.
//

import UIKit
import Kingfisher

extension UIImageView {
    func load(url: URL, placeholder: String) {
        self.kf.setImage(with: url, placeholder: UIImage(named: placeholder))
    }
}

