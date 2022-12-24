//
//  UserPageRouter.swift
//  FoodEr
//
//  Created by Abid Qurbanov on 14.12.2022.
//

import Foundation
class UserPageRouter : PresenterToRouterUserPageProtocol{
    static func createModule(ref: UserPageVC) {
        let presenter = UserPagePresenter()
        ref.userPagePresenterObject = presenter
        ref.userPagePresenterObject?.userPageInteractor = UserPageInteractor()
        ref.userPagePresenterObject?.userPageInteractor?.userPagePresenter = presenter
        ref.userPagePresenterObject?.userPageView = ref
    }
    
    
}
