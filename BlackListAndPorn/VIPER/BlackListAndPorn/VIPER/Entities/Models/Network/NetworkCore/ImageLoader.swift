//
//  ImageLoader.swift
//  BlackListAndPorn
//
//  Created by Suren Kazaryan on 02.04.2022.
//

import Foundation
import UIKit

final public class ImageLoader {
    
    private lazy var cache: NSCache<NSString, UIImage> = {
        let cache = NSCache<NSString, UIImage>()
        cache.totalCostLimit = 20 * 1000 * 1000
        return cache
    }()
    
    private lazy var loadingQueue = DispatchQueue(label: "image loading queue")
    
    public init() {}
}

extension ImageLoader {
    public func loadImage(by url: URL, completion: @escaping (UIImage?) -> Void) {
        loadingQueue.async {
            if let image = self.cache.object(forKey: url.absoluteString as NSString) {
                DispatchQueue.main.async {
                    completion(image)
                }
                return
            }
            guard let data = try? Data(contentsOf: url), let image = UIImage(data: data) else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            self.cache.setObject(image, forKey: url.absoluteString as NSString)
            DispatchQueue.main.async {
                completion(image)
            }
        }
    }
}
