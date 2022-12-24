//
//  OnboardingCell.swift
//  FoodEr
//
//  Created by Abid Qurbanov on 14.12.2022.
//

import UIKit
import Lottie
class OnboardingCell: UICollectionViewCell {
    static let identifier = String(describing: OnboardingCell.self)
   
    
    @IBOutlet weak var viewAnimation: UIView!
    
   
    @IBOutlet weak var titleLabelSlider: UILabel!
    
    @IBOutlet weak var descriptionLabelSlider: UILabel!
   
    func setup(slide:OnboardSlides){
        
        titleLabelSlider.text = slide.title
        descriptionLabelSlider.text = slide.desc
        
        
        let animation = LottieAnimationView(name: slide.animation!)
        viewAnimation.contentMode = .scaleAspectFit
        viewAnimation.addSubview(animation)
        animation.frame = viewAnimation.bounds
        animation.loopMode = .loop
        
        
        if (!animation.isAnimationPlaying){
            animation.play()
        }
   
        
        
    }
    
  
}
