//
//  MagicPresentTransion.swift
//  testTransitioning
//
//  Created by Liujinlong on 8/10/15.
//  Copyright © 2015 Jaylon. All rights reserved.
//

import UIKit

class MagicPresentTransion: NSObject, UIViewControllerAnimatedTransitioning {

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from) as! UINavigationController
        let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) as! SecondViewController
        let container = transitionContext.containerView
        
        var fromVCRect = fromVC.view.bounds
        fromVCRect.origin.y = -fromVCRect.height
        fromVCRect.origin.x = fromVCRect.width
        toVC.view.frame = fromVCRect
        
        container.addSubview(toVC.view)
        
        UIView.animate(withDuration: self.transitionDuration(using: transitionContext), animations: { () -> Void in
            toVC.view.frame = fromVC.view.bounds
            }, completion: { (finish) -> Void in
                transitionContext.completeTransition(true)
        }) 
        
    }
    
}
