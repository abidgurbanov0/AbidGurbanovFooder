//
//  RestoranPageProtocols.swift
//  FoodEr
//
//  Created by Abid Qurbanov on 14.12.2022.
//

import Foundation
protocol ViewToPresenterRestoranPageProtocol{
    var restoranPageInteractor: PresenterToInteractorRestoranPageProtocol?{get set}
    var restoranPageView: PresenterToViewRestoranPageProtocol?{get set}
    func getAllRest()
    func filterRest(segmentIndex:Int)
}
protocol PresenterToInteractorRestoranPageProtocol{
    var restoranPagePresenter:InteractorToPresenterRestoranPageProtocol?{get set}
    func getAllRestI()
    func filterRestI(segmentIndex:Int)
}

protocol InteractorToPresenterRestoranPageProtocol{
    func dataToPresenter(data:[Restaurant])
    func filterDataToPresener(data:[Restaurant])
}
protocol PresenterToViewRestoranPageProtocol{
    func dataToView(data:[Restaurant])
    func filterDataToView(data:[Restaurant])
}
protocol PresenterToRouterRestoranPageProtocol{
    static func createModule(ref: RestoranPageVC)
}
