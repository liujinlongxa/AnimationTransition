//
//  MagicDismissTransion.swift
//  testTransitioning
//
//  Created by Liujinlong on 8/10/15.
//  Copyright © 2015 Jaylon. All rights reserved.
//

import UIKit

class MagicDismissTransion: NSObject, UIViewControllerAnimatedTransitioning {

    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.5
    }
    
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey) as! SecondViewController
        let toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey) as! UINavigationController
        let container = transitionContext.containerView()!
        
        var fromVCRect = fromVC.view.bounds
        fromVCRect.origin.y = -fromVCRect.height
        fromVCRect.origin.x = fromVCRect.width
        
        container.addSubview(toVC.view)
        container.bringSubviewToFront(fromVC.view)
        
        UIView.animateWithDuration(self.transitionDuration(transitionContext), animations: { () -> Void in
            fromVC.view.frame = fromVCRect
        }) { (finish) -> Void in
            transitionContext.completeTransition(true)
        }
    }
    
}
