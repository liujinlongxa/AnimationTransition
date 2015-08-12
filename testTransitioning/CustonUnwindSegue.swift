//
//  CustonUnwindSegue.swift
//  AnimationTransition
//
//  Created by Liujinlong on 8/12/15.
//  Copyright © 2015 Jaylon. All rights reserved.
//

import UIKit

class CustonUnwindSegue: UIStoryboardSegue {

    override func perform() {
        let fromVCView = self.sourceViewController.view as UIView
        let toVCView = self.destinationViewController.navigationController!.view as UIView
        
        var frame = fromVCView.bounds
        
        toVCView.frame = frame
        toVCView.alpha = 0
        
        // 必须加两个
        UIApplication.sharedApplication().keyWindow?.addSubview(toVCView)
        UIApplication.sharedApplication().keyWindow?.addSubview(fromVCView)
        
        frame.origin.x = frame.width
        UIView.animateWithDuration(1.0, animations: { () -> Void in
            fromVCView.frame = frame
            toVCView.alpha = 1
            }) { (_) -> Void in
            self.sourceViewController.dismissViewControllerAnimated(false, completion: nil)
        }
        
    }
    
}
