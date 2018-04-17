//
//  TestViewController.swift
//  Ear Training
//
//  Created by 王富生 on 2017/3/3.
//  Copyright © 2017年 王富生. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var gameView: GamesViewScroll!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func start(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: gameView.gameData[gameView.currentIndex].name, bundle: nil)
        let nextVC = storyboard.instantiateViewController(withIdentifier: gameView.gameData[gameView.currentIndex].name) as! BaseViewController
        nextVC.transitioningDelegate = self
        present(nextVC, animated: true, completion: nil)
    }
}

extension MainViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let trainsistion = Transition()
        return trainsistion
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let trainsistion = Transition()
        return trainsistion
    }
}
