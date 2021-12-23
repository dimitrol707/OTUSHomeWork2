//
//  ViewStack.swift
//  OTUSHW2
//
//  Created by Дмитрий Мальцев on 21.12.2021.
//

import SwiftUI

struct ViewStack {
    private var views: [ViewStackElement] = .init()
    
    mutating func push(_ element: ViewStackElement) {
        guard indexForIdView(element.id) == nil else { return }
        views.append(element)
    }
    
    mutating func pop() {
        _ = views.removeLast()
    }
    
    mutating func popToRoot() {
        views.removeAll()
    }
    
    func indexForIdView(_ id: String) -> Int? {
        views.firstIndex { $0.id == id}
    }
    
    func lastView() -> ViewStackElement? {
        views.last
    }
}
