//
//  PresentAnimation.swift
//  Ear Training
//
//  Created by 王富生 on 2017/3/2.
//  Copyright © 2017年 王富生. All rights reserved.
//

import UIKit

class PresentAnimation: NSObject, UIViewControllerAnimatedTransitioning {
    
    var originFrame = CGRect.zero
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1.3
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromVC = transitionContext.viewController(forKey: .from),
            let toVC = transitionContext.viewController(forKey: .to) else {
                return
        }
        let container = transitionContext.containerView
        
        let initialFram = originFrame
        let finalFram = transitionContext.finalFrame(for: toVC)
        
        let snapShot = toVC.view.snapshotView(afterScreenUpdates: true)
        snapShot?.frame = initialFram
        snapShot?.layer.cornerRadius = 25
        snapShot?.layer.masksToBounds = true
        
        container.addSubview(toVC.view)
        container.addSubview(snapShot!)
        toVC.view.isHidden = true
        
        AnimationHelper.perspectiveTransformForContainerView(container)
        snapShot?.layer.transform = AnimationHelper.yRotation(M_PI_2)
        
        let duration = transitionDuration(using: transitionContext)
        
        UIView.animateKeyframes(withDuration: duration, delay: 0, options: .calculationModeCubic, animations: {
            
            
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1/3, animations: {fromVC.view.layer.transform = AnimationHelper.yRotation(-M_PI_2)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 1/3, relativeDuration: 1/3, animations: {snapShot?.layer.transform = AnimationHelper.yRotation(0.0)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 2/3, relativeDuration: 1/3, animations: {snapShot?.frame = finalFram
            })
        }, completion: { _ in
            
            toVC.view.isHidden = false
            fromVC.view.layer.transform = AnimationHelper.yRotation(0.0)
            snapShot?.removeFromSuperview()
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        })
    }
}


class DismissAnimation: NSObject, UIViewControllerAnimatedTransitioning {
    
    var destinationFrame = CGRect.zero
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1.0
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromVC = transitionContext.viewController(forKey: .from),
            let toVC = transitionContext.viewController(forKey: .to) else {
                return
        }
        let container = transitionContext.containerView
        
        let finalFram = destinationFrame
        
        let snapShot = fromVC.view.snapshotView(afterScreenUpdates: false)
        snapShot?.layer.cornerRadius = 25
        snapShot?.layer.masksToBounds = true
        
        container.addSubview(toVC.view)
        container.addSubview(snapShot!)
        fromVC.view.isHidden = true
        
        AnimationHelper.perspectiveTransformForContainerView(container)
        toVC.view.layer.transform = AnimationHelper.yRotation(-M_PI_2)
        
        let duration = transitionDuration(using: transitionContext)
        
        UIView.animateKeyframes(withDuration: duration, delay: 0, options: .calculationModeCubic, animations: {
            
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1/3, animations: {snapShot?.frame = finalFram
            })
            
            UIView.addKeyframe(withRelativeStartTime: 1/3, relativeDuration: 1/3, animations: {snapShot?.layer.transform = AnimationHelper.yRotation(M_PI_2)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 2/3, relativeDuration: 1/3, animations: { toVC.view.layer.transform = AnimationHelper.yRotation(0.0)
            })
        }, completion: { _ in
            
            toVC.view.isHidden = false
            snapShot?.removeFromSuperview()
            transitionContext.completeTransition(true)
        })
    }
}
