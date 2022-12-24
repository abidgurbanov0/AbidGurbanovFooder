//
//  OnboardingPageVC.swift
//  FoodEr
//
//  Created by Abid Qurbanov on 14.12.2022.
//

import UIKit
import FirebaseAuth
class OnboardingPageVC: UIViewController {

    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var buttonNext: UIButton!
    
    var onboardingSlides : [OnboardSlides] = []
    var currentPage = 0 {
        didSet{
            pageControl.currentPage = currentPage
            pageControl.currentPage = currentPage
            if currentPage == onboardingSlides.count - 1 {
                buttonNext.setTitle("Başla", for: .normal)
            } else {
                buttonNext.setTitle("Davam", for: .normal)
            }
        }}
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        onboardingSlides = [
            
            OnboardSlides(title: "Rahat Sifaris verin", desc: "Hersey bir addminda",animation: "cooking-pot" ),
            OnboardSlides(title: "Tez ve dadli ", desc: "Bir birinden dadli yemekler ucun kecin indi sifaris verin", animation: "winne-the-pooh"),
            OnboardSlides(title: "Eve catdirma xidmeti", desc: "Eve gunun istenilen vaxti isteniler saati catdirilma", animation: "delivery-boy")
                ]

        
    }
    

    @IBAction func buttonNextClicked(_ sender: UIButton) {
        if currentPage == onboardingSlides.count-1 {
          
             
                let controller = storyboard?.instantiateViewController(withIdentifier: "welcomePage") as! UINavigationController
                controller.modalPresentationStyle = .fullScreen
                controller.modalTransitionStyle = .coverVertical
                present(controller, animated: true, completion: nil)
               
            
            
            
        }else{
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }

    }
    
    
    

    
}

extension OnboardingPageVC : UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return onboardingSlides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCell.identifier, for: indexPath) as! OnboardingCell
        cell.setup(slide: onboardingSlides[indexPath.row])
        
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
        pageControl.currentPage = currentPage
    }
    
    
}
