//
//  CustomSegue.swift
//  AnimationTransition
//
//  Created by Liujinlong on 8/12/15.
//  Copyright © 2015 Jaylon. All rights reserved.
//

import UIKit

class CustomSegue: UIStoryboardSegue {

    override func perform() {
        let fromVCView = self.sourceViewController.view as UIView
        let toVCView = self.destinationViewController.view as UIView
        
        var frame = fromVCView.bounds
        frame.origin.x += frame.width
        
        toVCView.frame = frame
        UIApplication.sharedApplication().keyWindow?.addSubview(toVCView)
        
        frame.origin.x = 0
        UIView.animateWithDuration(1.0, animations: { () -> Void in
            toVCView.frame = frame
        }) { (_) -> Void in
            self.sourceViewController.presentViewController(self.destinationViewController, animated: false, completion: nil)
        }
        
    }
    
}
