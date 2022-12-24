//
//  protocols.swift
//  FoodEr
//
//  Created by Abid Qurbanov on 14.12.2022.
//

import Foundation
protocol FilterPageToHomePage{
    func SendSiralamaAndFilterToHomePage(filter:Int,siralama:String)
    
}
protocol DetailPageToHomePage{
    func sendBadgeCountToHomePage(badgeCount:Int)
}

protocol OrderDetailToCartPage{
    func deleteCart()
}

protocol CartPlusOrMinus{
    func cartPlus(indexPath: IndexPath)
    func cartMinus(indexPath: IndexPath)
}


protocol FavFoodUserPage{
    func favFood(indexPath:IndexPath)
}
