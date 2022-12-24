//
//  HomePageRouter.swift
//  FoodEr
//
//  Created by Abid Qurbanov on 14.12.2022.
//
import Foundation
class HomePageRouter:PresenterToRouterHomePageProtocol{
    static func createModule(ref: HomePageVC) {
        let presenter = HomePagePresenter()
        ref.homePagePresenterObject = presenter
        ref.homePagePresenterObject?.homePageInteractor = HomePageInteractor()
        ref.homePagePresenterObject?.homePageView = ref
        ref.homePagePresenterObject?.homePageInteractor?.homePagePresenter = presenter
    }
    
    
    
}
