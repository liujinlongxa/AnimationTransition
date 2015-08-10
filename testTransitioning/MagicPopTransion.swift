//
//  MagicPopTransion.swift
//  testTransitioning
//
//  Created by Liujinlong on 8/9/15.
//  Copyright © 2015 Jaylon. All rights reserved.
//

import UIKit

class MagicPopTransion: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.5
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey) as! ViewController
        let toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey) as! CollectionViewController
        let container = transitionContext.containerView()
        
        let snapShotView = fromVC.imageView.snapshotViewAfterScreenUpdates(false)
        snapShotView.frame = (container?.convertRect(fromVC.imageView.frame, fromView: fromVC.view))!
        fromVC.imageView.hidden = true
        
        toVC.view.frame = transitionContext.finalFrameForViewController(toVC)
        toVC.selectedCell?.imageView.hidden = true
        
        container?.insertSubview(toVC.view, belowSubview: fromVC.view)
        container?.addSubview(snapShotView)
        
        UIView.animateWithDuration(transitionDuration(transitionContext), animations: { () -> Void in
            snapShotView.frame = (container?.convertRect((toVC.selectedCell?.imageView.frame)!, fromView: toVC.selectedCell))!
            fromVC.view.alpha = 0
            }) { (finish) -> Void in
                toVC.selectedCell?.imageView.hidden = false
                snapShotView.removeFromSuperview()
                fromVC.imageView.hidden = false
                
                // 如果取消了，则不发送完成
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
                
        }
    }
}
