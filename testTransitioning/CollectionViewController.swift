//
//  CollectionViewController.swift
//  testTransitioning
//
//  Created by Liujinlong on 8/9/15.
//  Copyright © 2015 Jaylon. All rights reserved.
//

import UIKit

private let reuseIdentifier = "CollectionViewCell"

class CollectionViewController: UICollectionViewController, UINavigationControllerDelegate {
    
    var selectedCell:CollectionViewCell? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView?.backgroundColor = UIColor.blue
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.delegate = self
    }
    
    deinit {
        self.navigationController?.delegate = nil
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectedCell = self.collectionView?.cellForItem(at: indexPath) as? CollectionViewCell
        self.performSegue(withIdentifier: "pushToDetail", sender: nil)
    }
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        if operation == UINavigationControllerOperation.push {
            return MagicMoveTransion()
        }
        else {
            return nil
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pushToDetail" {
            let detailVC = segue.destination as! ViewController
            detailVC.image = self.selectedCell?.imageView.image
        }
    }
    
}
