//
//  FirstViewController.swift
//  testTransitioning
//
//  Created by Liujinlong on 8/10/15.
//  Copyright © 2015 Jaylon. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UIViewControllerTransitioningDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return MagicPresentTransion()
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return MagicDismissTransion()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "modelShow" {
            
            let secondVC = segue.destinationViewController
            secondVC.transitioningDelegate = self
            
        }
    }
    
}
