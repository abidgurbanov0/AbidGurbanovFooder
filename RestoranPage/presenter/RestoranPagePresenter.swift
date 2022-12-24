//
//  RestoranPagePresenter.swift
//  FoodEr
//
//  Created by Abid Qurbanov on 14.12.2022.
//

import Foundation
class RestoranPagePresenter:InteractorToPresenterRestoranPageProtocol,ViewToPresenterRestoranPageProtocol{
    func filterDataToPresener(data: [Restaurant]) {
        restoranPageView?.filterDataToView(data: data)
    }
    
    func filterRest(segmentIndex: Int) {
        restoranPageInteractor?.filterRestI(segmentIndex: segmentIndex)
    }
    
    var restoranPageInteractor: PresenterToInteractorRestoranPageProtocol?
    var restoranPageView: PresenterToViewRestoranPageProtocol?
    
    func dataToPresenter(data: [Restaurant]) {
        restoranPageView?.dataToView(data: data)
    }
    
    func getAllRest() {
        restoranPageInteractor?.getAllRestI()
    }
    

    
}
