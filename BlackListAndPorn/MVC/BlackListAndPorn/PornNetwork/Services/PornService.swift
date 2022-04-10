//
//  PornService.swift
//  BlackListAndPorn
//
//  Created by Suren Kazaryan on 05.04.2022.
//

import Foundation

protocol PornServiceProtocol {
    //  func fetchPorn<Res: Responsable>(completion: @escaping (CoreResult<Res>) -> Void)
}

struct PornService {
    private let pornNetwork = PornNetworkCore.shared
}

//MARK: - PornServiceProtocol
extension PornService: PornServiceProtocol {
    
    func fetchPorn() {
        let metaData = "breeds/image/random"
        pornNetwork.request(metadata: metaData,
                            complition: { (result: CoreResult<PornResponse>) in
            switch result {
            case .success(let response):
                print(response)
            case .failure(let error):
                print(error)
            }
        })
    }
    
    func fetchChihua(completion: @escaping (String?) -> Void) {
        let metaData = "breed/chihuahua/images/random"
        pornNetwork.request(metadata: metaData,
                            complition: { (result: CoreResult<PornResponse>) in
            switch result {
            case .success(let response):
              //  User.imageUrl = response.result.message
                completion(response.result.message)
            //    print(response)
            case .failure(let error):
                print(error)
            }
        })
    }
    
}
