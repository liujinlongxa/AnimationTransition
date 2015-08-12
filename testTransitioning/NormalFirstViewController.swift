//
//  NormalFirstViewController.swift
//  AnimationTransition
//
//  Created by Liujinlong on 8/12/15.
//  Copyright © 2015 Jaylon. All rights reserved.
//

import UIKit

class NormalFirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        // 设置模态的过场动画类型
        if segue.identifier == "normalSegue1" {
            segue.destinationViewController.modalTransitionStyle = UIModalTransitionStyle.FlipHorizontal
        }
        else if segue.identifier == "normalSegue2" {
            segue.destinationViewController.modalTransitionStyle = UIModalTransitionStyle.PartialCurl
        }
        
    }
    
    
    @IBAction func clickFirstButton(sender: AnyObject) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("normalSecondVC")
        
        //设置过场动画
        let transiton = CATransition()
        transiton.type = "cube"
        transiton.subtype = kCATransitionFromRight
        self.navigationController!.view.layer.addAnimation(transiton, forKey: "transitionAnimation")
        vc.view.backgroundColor = UIColor.orangeColor()
        
        self.navigationController?.pushViewController(vc
            , animated: false)
    }
    
    @IBAction func clickSecondButton(sender: AnyObject) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("normalSecondVC")
        
        //设置过场动画
        let transiton = CATransition()
        transiton.type = "pageCurl"
        self.navigationController!.view.layer.addAnimation(transiton, forKey: "transitionAnimation")
        vc.view.backgroundColor = UIColor.orangeColor()
        
        self.navigationController?.pushViewController(vc
            , animated: false)
        
    }
    @IBAction func unwindForSegue(unwindSegue:UIStoryboardSegue) {
        
    }

}
