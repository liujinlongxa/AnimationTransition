//
//  MagicMoveTransion.swift
//  testTransitioning
//
//  Created by Liujinlong on 8/9/15.
//  Copyright © 2015 Jaylon. All rights reserved.
//

import UIKit

class MagicMoveTransion: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from) as! CollectionViewController
        let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) as! ViewController
        let container = transitionContext.containerView
        
        let snapShotView = fromVC.selectedCell?.imageView.snapshotView(afterScreenUpdates: false)
        snapShotView?.frame = (container.convert((fromVC.selectedCell?.imageView.frame)!, from: fromVC.selectedCell))
        fromVC.selectedCell?.imageView.isHidden = true
        
        toVC.view.frame = transitionContext.finalFrame(for: toVC)
        toVC.view.alpha = 0
        
        container.addSubview(toVC.view)
        container.addSubview(snapShotView!)
        
        toVC.imageView.layoutIfNeeded()
        
        // 执行动画
        UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: UIViewAnimationOptions(), animations: { () -> Void in
            snapShotView?.frame = toVC.imageView.frame
            toVC.view.alpha = 1
        }) { (finish) -> Void in
            fromVC.selectedCell?.imageView.isHidden = false
            toVC.imageView.image = toVC.image
            snapShotView?.removeFromSuperview()
            transitionContext.completeTransition(true)
        }
        
    }
}
