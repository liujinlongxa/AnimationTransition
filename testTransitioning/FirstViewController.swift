//
//  FirstViewController.swift
//  testTransitioning
//
//  Created by Liujinlong on 8/10/15.
//  Copyright © 2015 Jaylon. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UIViewControllerTransitioningDelegate {

    private var percentDriven:UIPercentDrivenInteractiveTransition?
    private var beginPoint:CGPoint = CGPointZero
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
//        self.transitioningDelegate = self
//        let panGesture = UIPanGestureRecognizer(target: self, action: Selector("panGesture:"))
//        self.view.addGestureRecognizer(panGesture)
    }
    
    func panGesture(gesture:UIPanGestureRecognizer) {
        
        let progress = (gesture.locationInView(self.view).x - beginPoint.x) / (self.view.bounds.width - beginPoint.x)
        print(progress)
        
        if gesture.state == UIGestureRecognizerState.Began {
            beginPoint = gesture.locationInView(self.view)
            self.percentDriven = UIPercentDrivenInteractiveTransition()
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        else if gesture.state == UIGestureRecognizerState.Changed {
            self.percentDriven?.updateInteractiveTransition(progress)
        }
        else if gesture.state == UIGestureRecognizerState.Cancelled || gesture.state == UIGestureRecognizerState.Ended {
            if progress > 0.5 {
                self.percentDriven?.finishInteractiveTransition()
            }
            else {
                self.percentDriven?.cancelInteractiveTransition()
            }
            self.percentDriven = nil
        }
    }
    
    func interactionControllerForDismissal(animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return self.percentDriven
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
            let panGesture = UIPanGestureRecognizer(target: self, action: Selector("panGesture:"))
            secondVC.view.addGestureRecognizer(panGesture)
            
        }
    }
    
}
