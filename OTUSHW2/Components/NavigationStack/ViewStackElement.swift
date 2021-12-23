//
//  ViewStackElement.swift
//  OTUSHW2
//
//  Created by Дмитрий Мальцев on 21.12.2021.
//

import SwiftUI

struct ViewStackElement: Identifiable, Equatable {
    let id: String = UUID().uuidString
    let view: AnyView
    
    static func == (lhs: ViewStackElement, rhs: ViewStackElement) -> Bool {
        lhs.id == rhs.id
    }
}
