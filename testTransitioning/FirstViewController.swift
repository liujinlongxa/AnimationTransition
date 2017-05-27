//
//  FirstViewController.swift
//  testTransitioning
//
//  Created by Liujinlong on 8/10/15.
//  Copyright © 2015 Jaylon. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UIViewControllerTransitioningDelegate {

    fileprivate var percentDriven:UIPercentDrivenInteractiveTransition?
    fileprivate var beginPoint:CGPoint = CGPoint.zero
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func panGesture(_ gesture:UIPanGestureRecognizer) {
        
        let progress = (gesture.location(in: self.view).x - beginPoint.x) / (self.view.bounds.width - beginPoint.x)
        print(progress)
        
        if gesture.state == UIGestureRecognizerState.began {
            beginPoint = gesture.location(in: self.view)
            self.percentDriven = UIPercentDrivenInteractiveTransition()
            self.dismiss(animated: true, completion: nil)
        }
        else if gesture.state == UIGestureRecognizerState.changed {
            self.percentDriven?.update(progress)
        }
        else if gesture.state == UIGestureRecognizerState.cancelled || gesture.state == UIGestureRecognizerState.ended {
            if progress > 0.5 {
                self.percentDriven?.finish()
            }
            else {
                self.percentDriven?.cancel()
            }
            self.percentDriven = nil
        }
    }
    
    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return self.percentDriven
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return MagicPresentTransion()
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return MagicDismissTransion()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "modelShow" {
            
            let secondVC = segue.destination
            secondVC.transitioningDelegate = self
            let panGesture = UIPanGestureRecognizer(target: self, action: #selector(FirstViewController.panGesture(_:)))
            secondVC.view.addGestureRecognizer(panGesture)
            
        }
    }
    
}
