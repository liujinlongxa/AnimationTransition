//
//  MagicPresentTransion.swift
//  testTransitioning
//
//  Created by Liujinlong on 8/10/15.
//  Copyright © 2015 Jaylon. All rights reserved.
//

import UIKit

class MagicPresentTransion: NSObject, UIViewControllerAnimatedTransitioning {

    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.5
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        let fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey) as! UINavigationController
        let toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey) as! SecondViewController
        let container = transitionContext.containerView()!
        
        var fromVCRect = fromVC.view.bounds
        fromVCRect.origin.y = -fromVCRect.height
        fromVCRect.origin.x = fromVCRect.width
        toVC.view.frame = fromVCRect
        
        container.addSubview(toVC.view)
        
        UIView.animateWithDuration(self.transitionDuration(transitionContext), animations: { () -> Void in
            toVC.view.frame = fromVC.view.bounds
            }) { (finish) -> Void in
                transitionContext.completeTransition(true)
        }
        
    }
    
}
