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
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // 设置模态的过场动画类型
        if segue.identifier == "normalSegue1" {
            segue.destination.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal
        }
        else if segue.identifier == "normalSegue2" {
            segue.destination.modalTransitionStyle = UIModalTransitionStyle.partialCurl
        }
        
    }
    
    
    @IBAction func clickFirstButton(_ sender: AnyObject) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "normalSecondVC")
        
        //设置过场动画
        let transiton = CATransition()
        transiton.type = "cube"
        transiton.subtype = kCATransitionFromRight
        self.navigationController!.view.layer.add(transiton, forKey: "transitionAnimation")
        vc.view.backgroundColor = UIColor.orange
        
        self.navigationController?.pushViewController(vc
            , animated: false)
    }
    
    @IBAction func clickSecondButton(_ sender: AnyObject) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "normalSecondVC")
        
        //设置过场动画
        let transiton = CATransition()
        transiton.type = "pageCurl"
        self.navigationController!.view.layer.add(transiton, forKey: "transitionAnimation")
        vc.view.backgroundColor = UIColor.orange
        
        self.navigationController?.pushViewController(vc
            , animated: false)
        
    }
    @IBAction func unwindForSegue(_ unwindSegue:UIStoryboardSegue) {
        
    }

}
