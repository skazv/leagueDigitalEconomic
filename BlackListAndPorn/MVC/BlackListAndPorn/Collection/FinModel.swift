//
//  FinModel.swift
//  BlackListAndPorn
//
//  Created by Suren Kazaryan on 07.04.2022.
//

import Foundation
import UIKit

struct FinHeader {
    var name: String
    var cells: [FinCell]
}


struct FinCell {
    var name: String
    var image: UIImage
    var account: Int
}
