//
//  ImageViewModel.swift
//  OTUSHW2
//
//  Created by Дмитрий Мальцев on 22.12.2021.
//

import SwiftUI
import Combine

class ImageViewModel: ObservableObject {
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false
    
    private let imageUrl: String
    private let dataService: ImageService
    
    private var cancellables = Set<AnyCancellable>()
    
    init(imageUrl: String) {
        self.imageUrl = imageUrl
        self.dataService = .init(imageUrl: imageUrl)
        addSubscribers()
        self.isLoading = true
    }
    
    private func addSubscribers() {
        dataService.$image
            .sink { [weak self] _ in
                self?.isLoading = false
            } receiveValue: { [weak self] returnedImage in
                self?.image = returnedImage
            }
            .store(in: &cancellables)

    }
}
