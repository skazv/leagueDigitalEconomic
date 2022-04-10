//
//  ProfilViewProtocol.swift
//  BlackListAndPorn
//
//  Created by Suren Kazaryan on 09.04.2022.
//

import Foundation

protocol ProfileViewProtocol: AnyObject {
    
    var presenter: ProfilePresenterProtocol? { get set }
    
    // PRESENTER -> VIEW
    func show(person: PersonModel)
}
