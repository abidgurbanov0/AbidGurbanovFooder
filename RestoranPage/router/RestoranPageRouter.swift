//
//  RestoranPageRouter.swift
//  FoodEr
//
//  Created by Abid Qurbanov on 14.12.2022.
//

import Foundation
class RestoranPageRouter : PresenterToRouterRestoranPageProtocol{
    static func createModule(ref: RestoranPageVC) {
        let presenter = RestoranPagePresenter()
        ref.restoranPagePresenterObject = presenter
        ref.restoranPagePresenterObject?.restoranPageInteractor = RestoranPageInteractor()
        ref.restoranPagePresenterObject?.restoranPageView = ref
        ref.restoranPagePresenterObject?.restoranPageInteractor?.restoranPagePresenter = presenter
        
    }
    
    
}
