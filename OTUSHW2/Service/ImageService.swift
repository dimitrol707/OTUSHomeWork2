//
//  ImageService.swift
//  OTUSHW2
//
//  Created by Дмитрий Мальцев on 22.12.2021.
//

import SwiftUI
import Combine

class ImageService {
    @Published var image: UIImage? = nil
    private var imageSubsription: AnyCancellable?
    private var imageUrl: String
    private var imageCache: ImageCache = .getImageCache()
    
    init(imageUrl: String) {
        self.imageUrl = imageUrl
        getImage()
    }
    
    private func getImage() {
        if loadImageFromCache() {
            return
        }
        loadImageFromUrl()
    }
            
    func loadImageFromCache() -> Bool {
        guard let cacheImage = imageCache.get(forKey: imageUrl) else {
            return false
        }
        
        image = cacheImage
        return true
    }
    
    private func loadImageFromUrl() {
        guard let url = URL(string: imageUrl) else { return }
        
        imageSubsription = NetworkingManager.download(url: url)
            .tryMap({ data -> UIImage? in
                return UIImage(data: data)
            })
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: {
                [weak self] (returnedImage) in
                guard let self = self, let downloadedImage = returnedImage else { return }
                self.imageCache.set(forKey: self.imageUrl, image: downloadedImage)
                self.image = downloadedImage
                self.imageSubsription?.cancel()
            })
    }
}
