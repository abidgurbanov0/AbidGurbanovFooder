//
//  RegisterPageRouter.swift
//  FoodEr
//
//  Created by Abid Qurbanov on 14.12.2022.
//
import Foundation
class RegisterPageRouter{
    static func createModule(ref: RegisterPageVC) {
        let presenter = RegisterPagePresenter()
        ref.registerPagePresenterObject=presenter
        ref.registerPagePresenterObject?.registerPageInteractor = RegisterPageInteractor()
        ref.registerPagePresenterObject?.registerPageView = ref
        ref.registerPagePresenterObject?.registerPageInteractor?.registerPagePresenter = presenter
  
        
        
        
        
    }
    
}
