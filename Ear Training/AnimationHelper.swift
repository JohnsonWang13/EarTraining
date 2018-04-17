//
//  AnimationHelper.swift
//  Ear Training
//
//  Created by 王富生 on 2017/3/3.
//  Copyright © 2017年 王富生. All rights reserved.
//

import UIKit

struct AnimationHelper {
//    static func yRotation(_ angle: Double) -> CATransform3D {
//        return CATransform3DMakeRotation(CGFloat(angle), 0.0, 1.0, 0.0)
//    }
    
    static func perspectiveTransformForContainerView(_ containerView: UIView, scale: CGFloat) {
        var transform = CATransform3DIdentity
        let angle = scale * CGFloat(65.0 / 180.0 * Double.pi)
        let z = abs(scale * CGFloat(40.0))
        
        
        transform.m34 = -1.0/200
        transform = CATransform3DTranslate(transform, 0, 0, z)
        transform = CATransform3DRotate(transform, angle, 0, 1, 0)
        
        containerView.layer.transform = transform
    }
}
