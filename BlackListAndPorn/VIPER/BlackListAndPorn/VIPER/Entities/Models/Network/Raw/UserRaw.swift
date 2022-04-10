//
//  UserRaw.swift
//  BlackListAndPorn
//
//  Created by Suren Kazaryan on 02.04.2022.
//

import Foundation
import UIKit

struct UsersRaw: Codable {
    let results: [UserRaw]
}

struct UserRaw: Codable {
    let gender: String
    let name: NameRaw
    let picture: PictureRaw
}

struct NameRaw: Codable {
    let title: String
    let first: String
    let last: String
}

struct PictureRaw: Codable {
    let large: String
}
