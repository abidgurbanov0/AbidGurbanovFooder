//
//  RestoranPageInteractor.swift
//  FoodEr
//
//  Created by Abid Qurbanov on 14.12.2022.
//

import Foundation
class RestoranPageInteractor:PresenterToInteractorRestoranPageProtocol{
    var restArray : [Restaurant] = []
    func filterRestI(segmentIndex: Int) {
        refreshArray()
        switch segmentIndex{
        case 0:
            getAllRestI()
            break
  
        case 1:
            
            let f1 = restArray.filter({($0.category!)=="Pizza"})
            restArray = f1
            restoranPagePresenter?.filterDataToPresener(data: restArray)
            break
        case 2:
            
            let f1 = restArray.filter({($0.category!)=="Burger"})
            restArray = f1
            restoranPagePresenter?.filterDataToPresener(data: restArray)
            
            break
   
        default:
            break
        }
    
    
    
    
    
    }
    
    
    var restoranPagePresenter: InteractorToPresenterRestoranPageProtocol?
    func getAllRestI() {
        self.refreshArray()
        restoranPagePresenter?.dataToPresenter(data: restArray)
        
    }
    func refreshArray(){
        
        restArray = [
         Restaurant(name: "KFC", category: "Pizza", image: "kfc", star:3.5),
         Restaurant(name: "MC", category: "Burger", image: "mc", star:3.8),
]
        
    }
    
    
    
    
}
