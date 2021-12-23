//
//  NavigationStackViewModel.swift
//  OTUSHW2
//
//  Created by Дмитрий Мальцев on 21.12.2021.
//

import SwiftUI

enum NavigationType {
    case push
    case pop
}

class NavigationStackViewModel: ObservableObject {
    @Published var currentView: ViewStackElement?
    
    public static let defailtAnimation: Animation = .easeOut(duration: 0.2)
    private let animation: Animation
    private(set) var navigationType: NavigationType = .push
    private var viewStack: ViewStack = .init() {
        didSet {
            currentView = viewStack.lastView()
        }
    }
    
    init(animation: Animation = defailtAnimation) {
        self.animation = animation
    }
    
    public func push<Element: View>(_ element: Element) {
        withAnimation(animation) {
            navigationType = .push
            let viewStackElement = ViewStackElement(view: AnyView(element))
            viewStack.push(viewStackElement)
        }
    }
    
    public func pop(_ destination: PopDestination = .previous) {
        withAnimation(animation) {
            navigationType = .pop
            switch destination {
            case .previous:
                viewStack.pop()
            case .root:
                viewStack.popToRoot()
            }
        }
    }
}


