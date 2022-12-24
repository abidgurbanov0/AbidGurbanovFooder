//
//  HomePageVC.swift
//  FoodEr
//
//  Created by Abid Qurbanov on 14.12.2022.
//

import UIKit
import Kingfisher
import FirebaseAuth
class HomePageVC: UIViewController {
    var badgeForCart = 0
    @IBOutlet weak var imageRestaurant: UIImageView!
    
    @IBOutlet weak var foodsCollectionView: UICollectionView!
    var homePagePresenterObject : ViewToPresenterHomePageProtocol?
    var allFoods = [Foods]()
    
    @IBOutlet weak var searchBar: UISearchBar!
    var priceFilter = 100
    var siralama = " "
    var restoranName:String?
    var restoranImage:String?
    override func viewDidLoad() {
        self.hideKeyboardWhenTappedAround()
        searchBar.delegate = self
        foodsCollectionView.delegate = self
        foodsCollectionView.dataSource = self
        HomePageRouter.createModule(ref: self)
        homePagePresenterObject?.getAllFoods()
        cellDesign()
 
        navigationItem.title = restoranName!
        imageRestaurant.image = UIImage(named: restoranImage!)
        
        super.viewDidLoad()
        
       
    }
  
    


   
    
  
    
    
}


    
    



extension HomePageVC : PresenterToViewHomePageProtocol{
    func sendDataToView(foods: [Foods]) {
        
        self.allFoods = foods
      
        DispatchQueue.main.async {
            self.foodsCollectionView.reloadData()
        }
    }
}














extension HomePageVC : UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allFoods.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let url = "http://kasimadalan.pe.hu/foods/images/"
        let tempFood = allFoods[indexPath.row]
        let cell = foodsCollectionView.dequeueReusableCell(withReuseIdentifier: "UrunlerCollectionViewCell", for: indexPath) as! UrunlerCollectionViewCell
        
      
        if let url = URL(string: "\(url)\(tempFood.image!)"){
            DispatchQueue.main.async {
                cell.imageFood.kf.setImage(with : url)
            }
            
        }
        cell.labelFoodName.text = tempFood.name
        cell.labelFoodPrice.text = "\(tempFood.price!) azn"
        
        cell.layer.shadowRadius = 5
        cell.layer.shadowOffset = .zero
        cell.layer.shadowOpacity = 0.1
        cell.layer.shadowColor = UIColor.black.cgColor
        
        cell.layer.masksToBounds = false

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let food = allFoods[indexPath.row]
        performSegue(withIdentifier: "toDetail", sender: food)
        collectionView.deselectItem(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            if let food = sender as? Foods {
                let gidilecekVC = segue.destination as! DetailPageVC
                gidilecekVC.food = food
                gidilecekVC.delegate = self
            }
        }

    }

    func cellDesign(){
        let tasarim = UICollectionViewFlowLayout()
        
         tasarim.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
         tasarim.minimumInteritemSpacing = 0
         tasarim.minimumLineSpacing = 15
         
         
        let hucreGenisligi = foodsCollectionView.bounds.width-20
         tasarim.itemSize = CGSize(width: hucreGenisligi, height: 100)
        
         foodsCollectionView.collectionViewLayout = tasarim
    }
}


extension HomePageVC : DetailPageToHomePage{
    func sendBadgeCountToHomePage(badgeCount: Int) {
        self.badgeForCart = badgeCount
        
        if let tabItems = tabBarController?.tabBar.items{
            
            let cartItem = tabItems[0]
            if badgeForCart > 0{
                cartItem.badgeValue = String(badgeForCart)
            }
            
            
            
            
            
           
        }
    }
    
    
}
extension HomePageVC : UISearchBarDelegate
   {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            homePagePresenterObject?.getAllFoods()
        }else{
            homePagePresenterObject?.searchFoods(searchText: searchText)
        }
    }
   }
