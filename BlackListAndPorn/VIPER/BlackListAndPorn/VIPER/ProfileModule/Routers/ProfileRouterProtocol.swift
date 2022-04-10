//
//  ProfileRouterProtocol.swift
//  BlackListAndPorn
//
//  Created by Suren Kazaryan on 09.04.2022.
//

import Foundation
import UIKit

protocol ProfileRouterProtocol: AnyObject {
    
    static func createProfileRouterModule(with person: PersonModel) -> UIViewController
    
    // PRESENTER -> ROUTER
    func navigateBackToListViewController(from view: ProfileViewProtocol)
    
}
