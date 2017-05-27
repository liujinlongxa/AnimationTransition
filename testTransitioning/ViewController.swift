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
    
    var beginPoint:CGPoint = CGPoint.zero
    
    fileprivate var percentDriven:UIPercentDrivenInteractiveTransition?
    
    var image:UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // 必须写在didAppear里，如果卸载viewDidLoad里，就会造成Push转场动画只生效一次
        self.navigationController?.delegate = self
        
//        let edgePan = UIScreenEdgePanGestureRecognizer(target: self, action: Selector("edgePanGesture:"))
//        edgePan.edges = UIRectEdge.Left
        let edgePan = UIPanGestureRecognizer(target: self, action: #selector(ViewController.edgePanGesture(_:)))
        self.view.addGestureRecognizer(edgePan)
    }
    
    func edgePanGesture(_ gesture:UIPanGestureRecognizer) {
        let progess = (gesture.location(in: self.view).x - self.beginPoint.x) / (self.view.bounds.width - self.beginPoint.x)
        
        if gesture.state == UIGestureRecognizerState.began {
            self.beginPoint = gesture.location(in: self.view)
            self.percentDriven = UIPercentDrivenInteractiveTransition()
            self.navigationController?.popViewController(animated: true)
        }
        else if gesture.state == UIGestureRecognizerState.changed {
            self.percentDriven?.update(progess)
        }
        else if gesture.state == UIGestureRecognizerState.ended || gesture.state == UIGestureRecognizerState.cancelled {
            if progess > 0.5 {
                self.percentDriven?.finish()
            }
            else {
                self.percentDriven?.cancel()
            }
            self.percentDriven = nil
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        if animationController is MagicPopTransion {
            return self.percentDriven
        }
        else {
            return nil
        }
    }
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation == UINavigationControllerOperation.pop {
            return MagicPopTransion()
        } else {
            return nil
        }
    }
}

