//
//  ViewController.swift
//  testTransitioning
//
//  Created by Liujinlong on 8/9/15.
//  Copyright © 2015 Jaylon. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textView: UITextView!
    
    var beginPoint:CGPoint = CGPointZero
    
    private var percentDriven:UIPercentDrivenInteractiveTransition?
    
    var image:UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        // 必须写在didAppear里，如果卸载viewDidLoad里，就会造成Push转场动画只生效一次
        self.navigationController?.delegate = self
        
//        let edgePan = UIScreenEdgePanGestureRecognizer(target: self, action: Selector("edgePanGesture:"))
//        edgePan.edges = UIRectEdge.Left
        let edgePan = UIPanGestureRecognizer(target: self, action: Selector("edgePanGesture:"))
        self.view.addGestureRecognizer(edgePan)
    }
    
    func edgePanGesture(gesture:UIPanGestureRecognizer) {
        let progess = (gesture.locationInView(self.view).x - self.beginPoint.x) / (self.view.bounds.width - self.beginPoint.x)
        
        if gesture.state == UIGestureRecognizerState.Began {
            self.beginPoint = gesture.locationInView(self.view)
            self.percentDriven = UIPercentDrivenInteractiveTransition()
            self.navigationController?.popViewControllerAnimated(true)
        }
        else if gesture.state == UIGestureRecognizerState.Changed {
            self.percentDriven?.updateInteractiveTransition(progess)
        }
        else if gesture.state == UIGestureRecognizerState.Ended || gesture.state == UIGestureRecognizerState.Cancelled {
            if progess > 0.5 {
                self.percentDriven?.finishInteractiveTransition()
            }
            else {
                self.percentDriven?.cancelInteractiveTransition()
            }
            self.percentDriven = nil
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func navigationController(navigationController: UINavigationController, interactionControllerForAnimationController animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        if animationController is MagicPopTransion {
            return self.percentDriven
        }
        else {
            return nil
        }
    }
    func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation == UINavigationControllerOperation.Pop {
            return MagicPopTransion()
        } else {
            return nil
        }
    }
}

