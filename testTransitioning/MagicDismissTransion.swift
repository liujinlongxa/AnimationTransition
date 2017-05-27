//
//  MagicDismissTransion.swift
//  testTransitioning
//
//  Created by Liujinlong on 8/10/15.
//  Copyright © 2015 Jaylon. All rights reserved.
//

import UIKit

class MagicDismissTransion: NSObject, UIViewControllerAnimatedTransitioning {

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from) as! SecondViewController
        let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) as! UINavigationController
        let container = transitionContext.containerView
        
        var fromVCRect = fromVC.view.bounds
        fromVCRect.origin.y = -fromVCRect.height
        fromVCRect.origin.x = fromVCRect.width
        
        container.addSubview(toVC.view)
        container.bringSubview(toFront: fromVC.view)
        
        UIView.animate(withDuration: self.transitionDuration(using: transitionContext), animations: { () -> Void in
            fromVC.view.frame = fromVCRect
        }, completion: { (finish) -> Void in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }) 
    }
    
}
