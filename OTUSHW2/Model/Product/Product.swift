//
//  Product.swift
//  OTUSHW2
//
//  Created by Дмитрий Мальцев on 16.12.2021.
//

protocol Product {
    var id: Int? { get set }
    var url: String? { get set }
    var title: String? { get set }
    var imageUrl: String? { get set }
    var synopsis: String? { get set }
    var type: String? { get set }
    var members: Int? { get set }
    var genres: [DefaultData]? { get set }
    var explicitGenres: [DefaultData]? { get set }
    var themes: [DefaultData]? { get set }
    var score: Double? { get set }
}
