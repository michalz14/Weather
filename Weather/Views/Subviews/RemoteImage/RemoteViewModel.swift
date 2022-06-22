//
//  RemoteViewModel.swift
//  Weather
//
//  Created by Michał Zieliński on 22/06/2022.
//

import Foundation
import Combine
import SwiftUI

class ImageCache {
    enum Error: Swift.Error {
        case dataConversionFailed
        case sessionError(Swift.Error)
    }
    static let shared = ImageCache()
    private let cache = NSCache<NSURL, UIImage>()
    private init() { }
    
    static func image(for url: URL) -> AnyPublisher<UIImage?, ImageCache.Error> {
        guard let image = shared.cache.object(forKey: url as NSURL) else {
            return URLSession
                .shared
                .dataTaskPublisher(for: url)
                .tryMap { (tuple) -> UIImage in
                    let (data, _) = tuple
                    guard let image = UIImage(data: data) else {
                        throw Error.dataConversionFailed
                    }
                    shared.cache.setObject(image, forKey: url as NSURL)
                    return image
                }
                .mapError({ error in Error.sessionError(error) })
                .eraseToAnyPublisher()
        }
        return Just(image)
            .mapError({ _ in fatalError() })
            .eraseToAnyPublisher()
    }
}

class ImageViewModel: ObservableObject {
    @Published var image: UIImage?
    var cacheSubscription: AnyCancellable?
    
    private let url: URL?
    
    init(url: URL?, placeholder: UIImage = UIImage()) {
        self.url = url
        image = placeholder
        
    }
    
    func load() {
        if let url = url {
            cacheSubscription = ImageCache
                .image(for: url)
                .removeDuplicates()
                .replaceError(with: image)
                .receive(on: RunLoop.main, options: .none)
                .assign(to: \.image, on: self)
        }
    }
    
    func cancel() {
        cacheSubscription?.cancel()
    }
}

extension ImageViewModel {
    
    static func iamgeURL(for name: String) -> URL? {
        URL(string: "https://openweathermap.org/img/wn/\(name)@2x.png")
    }
}
