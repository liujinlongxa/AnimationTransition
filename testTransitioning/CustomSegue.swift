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
        let fromVCView = self.source.view as UIView
        let toVCView = self.destination.view as UIView
        
        var frame = fromVCView.bounds
        frame.origin.x += frame.width
        
        toVCView.frame = frame
        UIApplication.shared.keyWindow?.addSubview(toVCView)
        
        frame.origin.x = 0
        UIView.animate(withDuration: 1.0, animations: { () -> Void in
            toVCView.frame = frame
        }, completion: { (_) -> Void in
            self.source.present(self.destination, animated: false, completion: nil)
        }) 
        
    }
    
}
