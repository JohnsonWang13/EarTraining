//
//  DrawButton.swift
//  Ear Training
//
//  Created by 王富生 on 2017/4/20.
//  Copyright © 2017年 王富生. All rights reserved.
//

import UIKit

class NoteOuterRing: UIButton {
    
    private var bezierPath = UIBezierPath()
    private var rect: CGRect?
    var angle: Double = 0
    
    override func awakeFromNib() {
        
        self.isOpaque = true
        addTarget(self, action: #selector(touchDown), for: .touchDown)
        self.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0)
        self.titleLabel?.font = UIFont(name: "Optima-Bold", size: 20)
        
        rect = self.frame
//        self.alpha = 0
    }
    
    override func draw(_ rect: CGRect) {
        
        bezierPath.move(to: CGPoint(x: 264/528 * rect.width, y: -3/369 * rect.height))
        bezierPath.addCurve(to: CGPoint(x: 0, y: 33/369 * rect.height), controlPoint1: CGPoint(x: 133/528 * rect.width, y: -3/369 * rect.height), controlPoint2: CGPoint(x: 0, y: 33/369 * rect.height))
        bezierPath.addLine(to: CGPoint(x: 92/528 * rect.width, y: 366/369 * rect.height))
        bezierPath.addCurve(to: CGPoint(x: 264/528 * rect.width, y: 342/369 * rect.height), controlPoint1: CGPoint(x: 92/528 * rect.width, y: 366/369 * rect.height), controlPoint2: CGPoint(x: 177.25/528 * rect.width, y: 342/369 * rect.height))
        bezierPath.addCurve(to: CGPoint(x: 439/528 * rect.width, y: 366/369 * rect.height), controlPoint1: CGPoint(x: 350.75/528 * rect.width, y: 342/369 * rect.height), controlPoint2: CGPoint(x: 439/528 * rect.width, y: 366/369 * rect.height))
        bezierPath.addLine(to: CGPoint(x: 524/528 * rect.width, y: 33/369 * rect.height))
        bezierPath.addCurve(to: CGPoint(x: 264/528 * rect.width, y: -3/369 * rect.height), controlPoint1: CGPoint(x: 524/528 * rect.width, y: 33/369 * rect.height), controlPoint2: CGPoint(x: 395/528 * rect.width, y: -3/369 * rect.height))
        bezierPath.close()
        
//        UIColor.black.setStroke()
//        bezierPath.stroke()
        
        var titleTransform = CATransform3DIdentity
        titleTransform.m34 = -1 / 500
        titleTransform = CATransform3DRotate(titleTransform, CGFloat(-angle / 180 * Double.pi), 0, 0, 1)
        titleLabel?.layer.transform = titleTransform
        
        let transform = CGAffineTransform.init(rotationAngle: CGFloat(angle / 180 * Double.pi))
        self.transform = transform

    }
    
    func touchDown(button: NoteOuterRing, event: UIEvent) {
        if let touch = event.touches(for: button)?.first {
            let location = touch.location(in: button)
            
            if bezierPath.contains(location) == false {
                button.cancelTracking(with: nil)
            }
        }
    }
}

class NoteInnerRing: UIButton {
    
    private var bezierPath = UIBezierPath()
    private var rect: CGRect?
    var angle: Double = 0
    
    override func awakeFromNib() {
        
        self.isOpaque = true
        addTarget(self, action: #selector(touchDown), for: .touchDown)
        self.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0)
        self.titleLabel?.font = UIFont(name: "Optima-Bold", size: 20)
        
        rect = self.frame
//        self.alpha = 0
    }
    
    override func draw(_ rect: CGRect) {
        
        bezierPath.move(to: CGPoint(x: 41.5/91 * rect.width, y: 0.5/84 * rect.height))
        bezierPath.addCurve(to: CGPoint(x: 90.5/91 * rect.width, y: 9.5/84 * rect.height), controlPoint1: CGPoint(x: 64.5/91 * rect.width, y: 0.5/84 * rect.height), controlPoint2: CGPoint(x: 90.5/91 * rect.width, y: 9.5/84 * rect.height))
        bezierPath.addLine(to: CGPoint(x: 63.5/91 * rect.width, y: 82.5/84 * rect.height))
        bezierPath.addCurve(to: CGPoint(x: 41.5/91 * rect.width, y: 79.5/84 * rect.height), controlPoint1: CGPoint(x: 63.5/91 * rect.width, y: 82.5/84 * rect.height), controlPoint2: CGPoint(x: 52.25/91 * rect.width, y: 79.5/84 * rect.height))
        bezierPath.addCurve(to: CGPoint(x: 20.5/91 * rect.width, y: 82.5/84 * rect.height), controlPoint1: CGPoint(x: 30.75/91 * rect.width, y: 79.5/84 * rect.height), controlPoint2: CGPoint(x: 20.5/91 * rect.width, y: 82.5/84 * rect.height))
        bezierPath.addLine(to: CGPoint(x: 0.5/91 * rect.width, y: 6.5/84 * rect.height))
        bezierPath.addCurve(to: CGPoint(x: 41.5/91 * rect.width, y: 0.5/84 * rect.height), controlPoint1: CGPoint(x: 0.5/91 * rect.width, y: 6.5/84 * rect.height), controlPoint2: CGPoint(x: 18.5/91 * rect.width, y: 0.5/84 * rect.height))
        bezierPath.close()
        
//        UIColor.black.setStroke()
//        bezierPath.stroke()
        
        var titleTransform = CATransform3DIdentity
        titleTransform.m34 = -1 / 500
        titleTransform = CATransform3DRotate(titleTransform, CGFloat(-angle / 180 * Double.pi), 0, 0, 1)
        titleLabel?.layer.transform = titleTransform
        
        let transform = CGAffineTransform.init(rotationAngle: CGFloat(angle / 180 * Double.pi))
        self.transform = transform
        
    }
    
    func touchDown(button: NoteInnerRing, event: UIEvent) {
        if let touch = event.touches(for: button)?.first {
            let location = touch.location(in: button)
            
            if bezierPath.contains(location) == false {
                button.cancelTracking(with: nil)
            }
        }
    }
}

class IntervalOuterRing: UIButton {
    
    private var bezierPath = UIBezierPath()
    private var rect: CGRect?
    var angle: Double = 0
    
    override func awakeFromNib() {
        
        self.isOpaque = true
        addTarget(self, action: #selector(touchDown), for: .touchDown)
        self.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0)
        self.titleLabel?.font = UIFont(name: "Optima-Bold", size: 16)
        
        rect = self.frame
        //        self.alpha = 0
    }
    
    override func draw(_ rect: CGRect) {
        
        bezierPath.move(to: CGPoint(x: 264/528 * rect.width, y: -3/369 * rect.height))
        bezierPath.addCurve(to: CGPoint(x: 0, y: 33/369 * rect.height), controlPoint1: CGPoint(x: 133/528 * rect.width, y: -3/369 * rect.height), controlPoint2: CGPoint(x: 0, y: 33/369 * rect.height))
        bezierPath.addLine(to: CGPoint(x: 92/528 * rect.width, y: 366/369 * rect.height))
        bezierPath.addCurve(to: CGPoint(x: 264/528 * rect.width, y: 342/369 * rect.height), controlPoint1: CGPoint(x: 92/528 * rect.width, y: 366/369 * rect.height), controlPoint2: CGPoint(x: 177.25/528 * rect.width, y: 342/369 * rect.height))
        bezierPath.addCurve(to: CGPoint(x: 439/528 * rect.width, y: 366/369 * rect.height), controlPoint1: CGPoint(x: 350.75/528 * rect.width, y: 342/369 * rect.height), controlPoint2: CGPoint(x: 439/528 * rect.width, y: 366/369 * rect.height))
        bezierPath.addLine(to: CGPoint(x: 524/528 * rect.width, y: 33/369 * rect.height))
        bezierPath.addCurve(to: CGPoint(x: 264/528 * rect.width, y: -3/369 * rect.height), controlPoint1: CGPoint(x: 524/528 * rect.width, y: 33/369 * rect.height), controlPoint2: CGPoint(x: 395/528 * rect.width, y: -3/369 * rect.height))
        bezierPath.close()
        
        //        UIColor.black.setStroke()
        //        bezierPath.stroke()
        
        var titleTransform = CATransform3DIdentity
        titleTransform.m34 = -1 / 500
        titleTransform = CATransform3DRotate(titleTransform, CGFloat(-angle / 180 * Double.pi), 0, 0, 1)
        titleLabel?.layer.transform = titleTransform
        
        let transform = CGAffineTransform.init(rotationAngle: CGFloat(angle / 180 * Double.pi))
        self.transform = transform
        
    }
    
    func touchDown(button: IntervalOuterRing, event: UIEvent) {
        if let touch = event.touches(for: button)?.first {
            let location = touch.location(in: button)
            
            if bezierPath.contains(location) == false {
                button.cancelTracking(with: nil)
            }
        }
    }
}

class IntervalInnerRing: UIButton {
    
    private var bezierPath = UIBezierPath()
    private var rect: CGRect?
    var angle: Double = 0
    
    override func awakeFromNib() {
        
        self.isOpaque = true
        addTarget(self, action: #selector(touchDown), for: .touchDown)
        self.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0)
        self.titleLabel?.font = UIFont(name: "Optima-Bold", size: 16)
        
        rect = self.frame
        //        self.alpha = 0
    }
    
    override func draw(_ rect: CGRect) {
        
        bezierPath.move(to: CGPoint(x: 41.5/91 * rect.width, y: 0.5/84 * rect.height))
        bezierPath.addCurve(to: CGPoint(x: 90.5/91 * rect.width, y: 9.5/84 * rect.height), controlPoint1: CGPoint(x: 64.5/91 * rect.width, y: 0.5/84 * rect.height), controlPoint2: CGPoint(x: 90.5/91 * rect.width, y: 9.5/84 * rect.height))
        bezierPath.addLine(to: CGPoint(x: 63.5/91 * rect.width, y: 82.5/84 * rect.height))
        bezierPath.addCurve(to: CGPoint(x: 41.5/91 * rect.width, y: 79.5/84 * rect.height), controlPoint1: CGPoint(x: 63.5/91 * rect.width, y: 82.5/84 * rect.height), controlPoint2: CGPoint(x: 52.25/91 * rect.width, y: 79.5/84 * rect.height))
        bezierPath.addCurve(to: CGPoint(x: 20.5/91 * rect.width, y: 82.5/84 * rect.height), controlPoint1: CGPoint(x: 30.75/91 * rect.width, y: 79.5/84 * rect.height), controlPoint2: CGPoint(x: 20.5/91 * rect.width, y: 82.5/84 * rect.height))
        bezierPath.addLine(to: CGPoint(x: 0.5/91 * rect.width, y: 6.5/84 * rect.height))
        bezierPath.addCurve(to: CGPoint(x: 41.5/91 * rect.width, y: 0.5/84 * rect.height), controlPoint1: CGPoint(x: 0.5/91 * rect.width, y: 6.5/84 * rect.height), controlPoint2: CGPoint(x: 18.5/91 * rect.width, y: 0.5/84 * rect.height))
        bezierPath.close()
        
        //        UIColor.black.setStroke()
        //        bezierPath.stroke()
        
        var titleTransform = CATransform3DIdentity
        titleTransform.m34 = -1 / 500
        titleTransform = CATransform3DRotate(titleTransform, CGFloat(-angle / 180 * Double.pi), 0, 0, 1)
        titleLabel?.layer.transform = titleTransform
        
        let transform = CGAffineTransform.init(rotationAngle: CGFloat(angle / 180 * Double.pi))
        self.transform = transform
        
    }
    
    func touchDown(button: IntervalInnerRing, event: UIEvent) {
        if let touch = event.touches(for: button)?.first {
            let location = touch.location(in: button)
            
            if bezierPath.contains(location) == false {
                button.cancelTracking(with: nil)
            }
        }
    }
}

class ChordOuterRing: UIButton {
    
    private var bezierPath = UIBezierPath()
    private var rect: CGRect?
    var angle: Double = 0
    
    override func awakeFromNib() {
        
        self.isOpaque = true
        addTarget(self, action: #selector(touchDown), for: .touchDown)
        self.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0)
        self.titleLabel?.font = UIFont(name: "Optima-Bold", size: 16)
        
        rect = self.frame
//       self.alpha = 0
    }
    
    override func draw(_ rect: CGRect) {
        
        bezierPath.move(to: CGPoint(x: 45.5/253 * rect.width, y: 137.5/139 * rect.height))
        bezierPath.addCurve(to: CGPoint(x: 130.5/253 * rect.width, y: 123.5/139 * rect.height), controlPoint1: CGPoint(x: 45.5/253 * rect.width, y: 137.5/139 * rect.height), controlPoint2: CGPoint(x: 89.25/253 * rect.width, y: 123.5/139 * rect.height))
        bezierPath.addCurve(to: CGPoint(x: 210.5/253 * rect.width, y: 137.5/139 * rect.height), controlPoint1: CGPoint(x: 171.75/253 * rect.width, y: 123.5/139 * rect.height), controlPoint2: CGPoint(x: 210.5/253 * rect.width, y: 137.5/139 * rect.height))
        bezierPath.addLine(to: CGPoint(x: 252.5/253 * rect.width, y: 23.5/139 * rect.height))
        bezierPath.addCurve(to: CGPoint(x: 132.5/253 * rect.width, y: 1.5/139 * rect.height), controlPoint1: CGPoint(x: 252.5/253 * rect.width, y: 23.5/139 * rect.height), controlPoint2: CGPoint(x: 195.25/253 * rect.width, y: 2/139 * rect.height))
        bezierPath.addCurve(to: CGPoint(x: 1.5/253 * rect.width, y: 21.5/139 * rect.height), controlPoint1: CGPoint(x: 69.75/253 * rect.width, y: 1/139 * rect.height), controlPoint2: CGPoint(x: 1.5/253 * rect.width, y: 21.5/139 * rect.height))
        bezierPath.addLine(to: CGPoint(x: 45.5/253 * rect.width, y: 137.5/139 * rect.height))
        bezierPath.close()

//        UIColor.black.setStroke()
//        bezierPath.stroke()
        
        var titleTransform = CATransform3DIdentity
        titleTransform.m34 = -1 / 500
        titleTransform = CATransform3DRotate(titleTransform, CGFloat(-angle / 180 * Double.pi), 0, 0, 1)
        titleLabel?.layer.transform = titleTransform
        
        let transform = CGAffineTransform.init(rotationAngle: CGFloat(angle / 180 * Double.pi))
        self.transform = transform
        
    }
    
    func touchDown(button: ChordOuterRing, event: UIEvent) {
        if let touch = event.touches(for: button)?.first {
            let location = touch.location(in: button)
            
            if bezierPath.contains(location) == false {
                button.cancelTracking(with: nil)
            }
        }
    }
}

class ChordInnerRing: UIButton {
    
    private var bezierPath = UIBezierPath()
    private var rect: CGRect?
    var angle: Double = 0
    
    override func awakeFromNib() {
        
        self.isOpaque = true
        addTarget(self, action: #selector(touchDown), for: .touchDown)
        self.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0)
        self.titleLabel?.font = UIFont(name: "Optima-Bold", size: 16)
        
        rect = self.frame
//        self.alpha = 0
    }
    
    override func draw(_ rect: CGRect) {
        
        bezierPath.move(to: CGPoint(x: 79/153 * rect.width, y: 1/104 * rect.height))
        bezierPath.addCurve(to: CGPoint(x: 1/153 * rect.width, y: 18/104 * rect.height), controlPoint1: CGPoint(x: 41.25/153 * rect.width, y: 0.5/104 * rect.height), controlPoint2: CGPoint(x: 1/153 * rect.width, y: 18/104 * rect.height))
        bezierPath.addLine(to: CGPoint(x: 40/153 * rect.width, y: 102/104 * rect.height))
        bezierPath.addCurve(to: CGPoint(x: 77/153 * rect.width, y: 95/104 * rect.height), controlPoint1: CGPoint(x: 40/153 * rect.width, y: 102/104 * rect.height), controlPoint2: CGPoint(x: 58.75/153 * rect.width, y: 95/104 * rect.height))
        bezierPath.addCurve(to: CGPoint(x: 113/153 * rect.width, y: 102/104 * rect.height), controlPoint1: CGPoint(x: 95.25/153 * rect.width, y: 95/104 * rect.height), controlPoint2: CGPoint(x: 113/153 * rect.width, y: 102/104 * rect.height))
        bezierPath.addLine(to: CGPoint(x: 152/153 * rect.width, y: 18/104 * rect.height))
        bezierPath.addCurve(to: CGPoint(x: 79/153 * rect.width, y: 1/104 * rect.height), controlPoint1: CGPoint(x: 152/153 * rect.width, y: 18/104 * rect.height), controlPoint2: CGPoint(x: 116.75/153 * rect.width, y: 1.5/104 * rect.height))
        bezierPath.close()
        
//        UIColor.black.setStroke()
//        bezierPath.stroke()
        
        var titleTransform = CATransform3DIdentity
        titleTransform.m34 = -1 / 500
        titleTransform = CATransform3DRotate(titleTransform, CGFloat(-angle / 180 * Double.pi), 0, 0, 1)
        titleLabel?.layer.transform = titleTransform
        
        let transform = CGAffineTransform.init(rotationAngle: CGFloat(angle / 180 * Double.pi))
        self.transform = transform
        
    }
    
    func touchDown(button: ChordInnerRing, event: UIEvent) {
        if let touch = event.touches(for: button)?.first {
            let location = touch.location(in: button)
            
            if bezierPath.contains(location) == false {
                button.cancelTracking(with: nil)
            }
        }
    }
}

class ScaleRing: UIButton {
    
    private var bezierPath = UIBezierPath()
    private var rect: CGRect?
    var angle: Double = 0
    
    override func awakeFromNib() {
        
        self.isOpaque = true
        addTarget(self, action: #selector(touchDown), for: .touchDown)
        self.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0)
        
        rect = self.frame
    }
    
    override func draw(_ rect: CGRect) {
        
        bezierPath.move(to: CGPoint(x: 104.5/200 * rect.width, y: 1.5/275 * rect.height))
        bezierPath.addCurve(to: CGPoint(x: 1.5, y: 15.5), controlPoint1: CGPoint(x: 55, y: 2.25), controlPoint2: CGPoint(x: 1.5, y: 15.5))
        bezierPath.addLine(to: CGPoint(x: 75.5, y: 273.5))
        bezierPath.addCurve(to: CGPoint(x: 104.5, y: 269.5), controlPoint1: CGPoint(x: 75.5, y: 273.5), controlPoint2: CGPoint(x: 90, y: 269.5))
        bezierPath.addCurve(to: CGPoint(x: 133.5, y: 273.5), controlPoint1: CGPoint(x: 119, y: 269.5), controlPoint2: CGPoint(x: 133.5, y: 273.5))
        bezierPath.addLine(to: CGPoint(x: 199.5, y: 12.5))
        bezierPath.addCurve(to: CGPoint(x: 104.5, y: 1.5), controlPoint1: CGPoint(x: 199.5, y: 12.5), controlPoint2: CGPoint(x: 154, y: 0.75))
        bezierPath.close()
        
        UIColor.black.setStroke()
        bezierPath.stroke()
        
        var titleTransform = CATransform3DIdentity
        titleTransform.m34 = -1 / 500
        titleTransform = CATransform3DRotate(titleTransform, CGFloat(-angle / 180 * Double.pi), 0, 0, 1)
        titleLabel?.layer.transform = titleTransform
        
        let transform = CGAffineTransform.init(rotationAngle: CGFloat(angle / 180 * Double.pi))
        self.transform = transform
        
    }
    
    func touchDown(button: ScaleRing, event: UIEvent) {
        if let touch = event.touches(for: button)?.first {
            let location = touch.location(in: button)
            
            if bezierPath.contains(location) == false {
                button.cancelTracking(with: nil)
            }
        }
    }
}
