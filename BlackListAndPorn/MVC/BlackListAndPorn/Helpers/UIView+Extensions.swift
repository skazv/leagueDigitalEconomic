//
//  UIView+Extensions.swift
//  BlackListAndPorn
//
//  Created by Suren Kazaryan on 01.04.2022.
//

import UIKit

extension UIView {
    func addSubviews(views: [UIView]) {
        views.forEach { addSubview($0) }
    }
}
