//
//  MagicPopTransion.swift
//  testTransitioning
//
//  Created by Liujinlong on 8/9/15.
//  Copyright © 2015 Jaylon. All rights reserved.
//

import UIKit

class MagicPopTransion: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from) as! ViewController
        let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) as! CollectionViewController
        let container = transitionContext.containerView
        
        let snapShotView = fromVC.imageView.snapshotView(afterScreenUpdates: false)
        snapShotView?.frame = (container.convert(fromVC.imageView.frame, from: fromVC.view))
        fromVC.imageView.isHidden = true
        
        toVC.view.frame = transitionContext.finalFrame(for: toVC)
        toVC.selectedCell?.imageView.isHidden = true
        
        container.insertSubview(toVC.view, belowSubview: fromVC.view)
        container.addSubview(snapShotView!)
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: { () -> Void in
            snapShotView?.frame = (container.convert((toVC.selectedCell?.imageView.frame)!, from: toVC.selectedCell))
            fromVC.view.alpha = 0
            }, completion: { (finish) -> Void in
                toVC.selectedCell?.imageView.isHidden = false
                snapShotView?.removeFromSuperview()
                fromVC.imageView.isHidden = false
                
                // 如果取消了，则不发送完成
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
                
        }) 
    }
}
