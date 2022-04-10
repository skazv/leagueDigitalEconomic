//
//  PornNetvorkCore.swift
//  BlackListAndPorn
//
//  Created by Suren Kazaryan on 04.04.2022.
//

import Foundation

//typealias CoreResalt<T: Responsable> = Swift.Result<T, NetworkError>

protocol PornNetworkCoreProtocol {
    func request<Res: Responsable>(metadata: String, complition: @escaping (CoreResult<Res>) -> Void)
}

struct PornNetworkCore {
    static let shared: PornNetworkCoreProtocol = PornNetworkCore()
    
    private let url = "https://dog.ceo/api"
    private let jsonDecoder = JSONDecoder()
}

extension PornNetworkCore: PornNetworkCoreProtocol {
    func request<Res>(metadata: String, complition: @escaping (CoreResult<Res>) -> Void) where Res : Responsable {
        let requestUrl = URL(string: "\(url)/\(metadata)")
        print(requestUrl)
        guard let url = requestUrl else {
            complition(.failure(NetworkError.invalidUrl))
            return
        }
        let dataTask = URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            if let data = data, (response as? HTTPURLResponse)?.statusCode == 200, error == nil {
                self.handleSuccessDataResponse(data: data, completion: complition)
            } else {
                print(NetworkError.handleDataResponesError)
            }
        })
        dataTask.resume()

    }
    
    
}

//MARK: - Private methods
extension PornNetworkCore {
    private func handleSuccessDataResponse<Res: Responsable>(data: Data, completion: @escaping (CoreResult<Res>) -> Void) {
        do {
            print(data)
            completion(.success(try decodeData(data: data)))
        } catch {
            completion(.failure(.responseDecodingError))
        }
    }
    private func decodeData<Res: Responsable>(data: Data) throws -> Res {
        let response = try jsonDecoder.decode(Res.self, from: data)
        return response
    }
    
    
}
