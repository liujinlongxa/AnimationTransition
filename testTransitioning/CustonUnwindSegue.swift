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
        let fromVCView = self.source.view as UIView
        let toVCView = self.destination.navigationController!.view as UIView
        
        var frame = fromVCView.bounds
        
        toVCView.frame = frame
        toVCView.alpha = 0
        
        // 必须加两个
        UIApplication.shared.keyWindow?.addSubview(toVCView)
        UIApplication.shared.keyWindow?.addSubview(fromVCView)
        
        frame.origin.x = frame.width
        UIView.animate(withDuration: 1.0, animations: { () -> Void in
            fromVCView.frame = frame
            toVCView.alpha = 1
            }, completion: { (_) -> Void in
            self.source.dismiss(animated: false, completion: nil)
        }) 
        
    }
    
}
