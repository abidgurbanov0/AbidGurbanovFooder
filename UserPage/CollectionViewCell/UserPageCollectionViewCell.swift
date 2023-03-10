//
//  UserPageCollectionViewCell.swift
//  FoodEr
//
//  Created by Abid Qurbanov on 14.12.2022.
//
import UIKit

class UserPageCollectionViewCell: UICollectionViewCell {
    var delegate : FavFoodUserPage?
    var indexPath : IndexPath?
    @IBOutlet weak var labelFoodName: UILabel!
    @IBOutlet weak var imageFood: UIImageView!
    @IBOutlet weak var buttonFav: UIButton!
    
    
    @IBAction func buttonFavAction(_ sender: UIButton) {
        sender.preventRepeatedPresses()
        delegate?.favFood(indexPath: indexPath!)
        
        
    }
    
    
}
