//
//  HomePagePresenter.swift
//  FoodEr
//
//  Created by Abid Qurbanov on 14.12.2022.
//

import Foundation
class HomePagePresenter: ViewToPresenterHomePageProtocol,InteractorToPresenterHomePageProtocol{
    var homePageInteractor: PresenterToInteractorHomePageProtocol?
    var homePageView: PresenterToViewHomePageProtocol?
    
    
    
    func searchFoods(searchText: String) {
        homePageInteractor?.searchFoodsI(searchText: searchText)
    }
    

    
    
    func getAllFoods() {
        homePageInteractor?.getAllFoodsI()
    }
    
    func sendDataToPresenter(foods: [Foods]) {
        
        homePageView?.sendDataToView(foods: foods)
     

        
    }
    
    
}
