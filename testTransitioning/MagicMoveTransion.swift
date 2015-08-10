//
//  MagicMoveTransion.swift
//  testTransitioning
//
//  Created by Liujinlong on 8/9/15.
//  Copyright © 2015 Jaylon. All rights reserved.
//

import UIKit

class MagicMoveTransion: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.5
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey) as! CollectionViewController
        let toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey) as! ViewController
        let container = transitionContext.containerView()
        
        let snapShotView = fromVC.selectedCell?.imageView.snapshotViewAfterScreenUpdates(false)
        snapShotView?.frame = (container?.convertRect((fromVC.selectedCell?.imageView.frame)!, fromView: fromVC.selectedCell))!
        fromVC.selectedCell?.imageView.hidden = true
        
        toVC.view.frame = transitionContext.finalFrameForViewController(toVC)
        toVC.view.alpha = 0
        
        container?.addSubview(toVC.view)
        container?.addSubview(snapShotView!)
        
        toVC.imageView.layoutIfNeeded()
        
        // 执行动画
        UIView.animateWithDuration(transitionDuration(transitionContext), delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            snapShotView?.frame = toVC.imageView.frame
            toVC.view.alpha = 1
        }) { (finish) -> Void in
            fromVC.selectedCell?.imageView.hidden = false
            toVC.imageView.image = toVC.image
            snapShotView?.removeFromSuperview()
            transitionContext.completeTransition(true)
        }
        
    }
}
