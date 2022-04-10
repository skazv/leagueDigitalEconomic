//
//  UserService.swift
//  BlackListAndPorn
//
//  Created by Suren Kazaryan on 02.04.2022.
//

import Foundation

protocol UserServiceProtocol {
    func fetchWoman(completion: @escaping (Swift.Result<[UserRaw], Error>) -> Void)
}

struct UserService {
    private let network = NetworkCore.shared
}

extension UserService: UserServiceProtocol {
    func fetchWoman(completion: @escaping (Result<[UserRaw], Error>) -> Void) {
        let metadata = "?gender=female"
        network.request(metadata: metadata,
                        completion: { (result: CoreResult<UserResponse>) in
            switch result {
            case .success(let response):
                completion(.success(response.results.results))
            case .failure(let error):
                completion(.failure(error))
            }
        })
    }
    
}
