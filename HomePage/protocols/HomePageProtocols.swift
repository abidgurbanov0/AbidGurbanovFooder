//
//  HomePageProtocols.swift
//  FoodEr
//
//  Created by Abid Qurbanov on 14.12.2022.
//

import Foundation

protocol ViewToPresenterHomePageProtocol{
    var homePageInteractor : PresenterToInteractorHomePageProtocol?{get set}
    var homePageView : PresenterToViewHomePageProtocol?{get set}
    func getAllFoods()

    func searchFoods(searchText:String)
    
}
protocol PresenterToInteractorHomePageProtocol{
    var homePagePresenter : InteractorToPresenterHomePageProtocol?{get set}
    func getAllFoodsI()

    func searchFoodsI(searchText:String)
}



protocol InteractorToPresenterHomePageProtocol{
    func sendDataToPresenter(foods:[Foods])
}

protocol PresenterToViewHomePageProtocol{
   func sendDataToView(foods:[Foods])
}


protocol PresenterToRouterHomePageProtocol{
    static func createModule(ref: HomePageVC)
}
