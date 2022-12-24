//
//  HomePageInteractor.swift
//  FoodEr
//
//  Created by Abid Qurbanov on 14.12.2022.
//

import Foundation
import Alamofire
class HomePageInteractor : PresenterToInteractorHomePageProtocol{
    var homePagePresenter: InteractorToPresenterHomePageProtocol?
    var allFoods = [Foods]()
    
    
    func searchFoodsI(searchText: String) {
        var searchFoods = [Foods]()
        for food in allFoods{
            if food.name!.lowercased().contains(searchText.lowercased()) {
                searchFoods.append(food)
                
            }
        }
        self.homePagePresenter?.sendDataToPresenter(foods: searchFoods)
    }
    
  
    func getAllFoodsI() {
        AF.request("http://kasimadalan.pe.hu/foods/getAllFoods.php",method: .get).response{response in
            if let data = response.data{
                do{
                    let answer = try JSONDecoder().decode(FoodsResponse.self, from: data)
                    if let foods = answer.foods{
                        self.allFoods = foods
                        self.homePagePresenter?.sendDataToPresenter(foods: foods)
                    }
                    
                }catch{
                    print(error.localizedDescription.description)
                }
            }
        }
                   

    }
}
