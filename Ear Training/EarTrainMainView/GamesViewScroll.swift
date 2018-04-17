//
//  GamesView.swift
//  EarTrainMainView
//
//  Created by 王富生 on 2017/3/17.
//  Copyright © 2017年 王富生. All rights reserved.
//

import UIKit

class GamesViewScroll: UIView {
    
    let gameDataBase = GamesDataBase()
    
    var gameData = [GamesData]()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.layer.cornerRadius = 22.0
        
    }
    
    fileprivate lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView.init(frame: CGRect(x: 0,
                                                         y: self.bounds.minY,
                                                         width: self.bounds.width,
                                                         height: self.bounds.height - 20))
        scrollView.contentSize = CGSize(width: self.bounds.width * 3, height: scrollView.contentSize.height)
        scrollView.contentOffset = CGPoint(x: self.bounds.width, y: 0)
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.isPagingEnabled = true
        scrollView.backgroundColor = UIColor.lightGray
        return scrollView
    }()
    
    fileprivate lazy var invisibleScrollView: UIScrollView = {
        let invisibleScrollView = UIScrollView.init(frame: CGRect(x: self.bounds.width * 5 / 19,
                                                                  y: self.bounds.minY,
                                                                  width: self.bounds.width * 12 / 19,
                                                                  height: self.bounds.height - 20))
        invisibleScrollView.contentSize = CGSize(width: self.bounds.width * 36 / 19, height: invisibleScrollView.contentSize.height)
        invisibleScrollView.contentOffset = CGPoint(x: self.bounds.width * 12 / 19, y: 0)
        invisibleScrollView.showsHorizontalScrollIndicator = false
        invisibleScrollView.showsVerticalScrollIndicator = false
        invisibleScrollView.isPagingEnabled = true
        invisibleScrollView.delegate = self
        invisibleScrollView.isUserInteractionEnabled = false
        invisibleScrollView.isHidden = true
        invisibleScrollView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.2)
        return invisibleScrollView
    }()
    
    fileprivate lazy var currentGame: GameView = {
        let currentGame = GameView.init(frame: CGRect(x: self.bounds.width * 24 / 19,
                                                      y: self.bounds.height / 10,
                                                      width: self.bounds.width * 9 / 19,
                                                      height: self.bounds.height * 4 / 5))
        AnimationHelper.perspectiveTransformForContainerView(currentGame, contentOffset: self.scrollView.contentOffset.x - UIScreen.main.bounds.width)
        currentGame.image.image = self.gameData[0].image
        currentGame.title.text = self.gameData[0].name
        
        return currentGame
    }()
    
    fileprivate lazy var leftGame: GameView = {
        let leftGame = GameView.init(frame: CGRect(x: self.bounds.width * 12 / 19,
                                                   y: self.bounds.height / 10,
                                                   width: self.bounds.width * 9 / 19,
                                                   height: self.bounds.height * 4 / 5))
        
        AnimationHelper.perspectiveTransformForContainerView(leftGame, contentOffset: self.scrollView.contentOffset.x)
        
        leftGame.image.image = self.gameData[self.gameData.count - 1].image
        leftGame.title.text = self.gameData[self.gameData.count - 1].name
        
        return leftGame
    }()
    
    
    fileprivate lazy var leftleftGame: GameView = {
        let leftleftGame = GameView.init(frame: CGRect(x: 0,
                                                       y: self.bounds.height / 10,
                                                       width: self.bounds.width * 9 / 19,
                                                       height: self.bounds.height * 4 / 5))
        
        AnimationHelper.perspectiveTransformForContainerView(leftleftGame, contentOffset: self.scrollView.contentOffset.x + UIScreen.main.bounds.width)
        leftleftGame.image.image = self.gameData[self.gameData.count - 2].image
        leftleftGame.title.text = self.gameData[self.gameData.count - 2].name
        
        return leftleftGame
    }()
    
    fileprivate lazy var rightGame: GameView = {
        let rightGame = GameView.init(frame: CGRect(x: self.bounds.width * 36 / 19,
                                                    y: self.bounds.height / 10,
                                                    width: self.bounds.width * 9 / 19,
                                                    height: self.bounds.height * 4 / 5))
        AnimationHelper.perspectiveTransformForContainerView(rightGame, contentOffset: self.scrollView.contentOffset.x - UIScreen.main.bounds.width * 2)
        rightGame.image.image = self.gameData[1].image
        rightGame.title.text = self.gameData[1].name
        
        return rightGame
    }()
    
    fileprivate lazy var rightrightGame: GameView = {
        let rightrightGame = GameView.init(frame: CGRect(x: self.bounds.width * 48 / 19,
                                                         y: self.bounds.height / 10,
                                                         width: self.bounds.width * 9 / 19,
                                                         height: self.bounds.height * 4 / 5))
        AnimationHelper.perspectiveTransformForContainerView(rightrightGame, contentOffset: self.scrollView.contentOffset.x - UIScreen.main.bounds.width * 3)
        rightrightGame.image.image = self.gameData[1].image
        rightrightGame.title.text = self.gameData[1].name
        
        return rightrightGame
    }()
    
    fileprivate lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl.init(frame: CGRect(x: self.bounds.width / 2 - 50,
                                                           y: self.bounds.maxY - 17,
                                                           width: 100,
                                                           height: 20))
        pageControl.numberOfPages = self.gameData.count
        pageControl.pageIndicatorTintColor = UIColor.gray
        pageControl.currentPageIndicatorTintColor = UIColor.blue
        
        return pageControl
    }()
    //
    //    fileprivate lazy var pictureLabel: UILabel = {
    //        let pictureLabel = UILabel.init(frame: CGRect(x: 20,
    //                                                      y: self.bounds.maxY + self.pageControl.bounds.height - 17,
    //                                                      width: 100,
    //                                                      height: 30))
    //        pictureLabel.text = self.gameData[0].discription
    //        pictureLabel.font = pictureLabel.font.withSize(18)
    //        return pictureLabel
    //    }()
    
    fileprivate var currentIndex = 0 {
        didSet {
            
            currentGame.image.image = gameData[currentIndex].image
            currentGame.title.text = gameData[currentIndex].name
            
        }
    }
    fileprivate var leftIndex = 3 {
        didSet {
            leftGame.image.image = self.gameData[leftIndex].image
            leftGame.title.text = self.gameData[leftIndex].name
        }
    }
    fileprivate var rightIndex = 1 {
        didSet {
            rightGame.image.image = self.gameData[rightIndex].image
            rightGame.title.text = self.gameData[rightIndex].name
        }
    }
    
    enum Direction {
        case none
        case right
        case left
    }
    
    
    fileprivate var direction: Direction?
    
    override func layoutSubviews() {
        
        gameData = gameDataBase.gameData
        
        addSubview(scrollView)
        scrollView.addSubview(currentGame)
        scrollView.addSubview(leftGame)
        scrollView.addSubview(rightGame)
        scrollView.addSubview(leftleftGame)
        scrollView.addSubview(rightrightGame)
        addSubview(invisibleScrollView)
        scrollView.addGestureRecognizer(invisibleScrollView.panGestureRecognizer)
        
        addSubview(pageControl)
        //        addSubview(pictureLabel)
        
        
    }
}

extension GamesViewScroll: UIScrollViewDelegate {
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        direction = invisibleScrollView.contentOffset.x > UIScreen.main.bounds.width * 12 / 19 ? .right : .left
        self.scrollView.contentOffset.x = invisibleScrollView.contentOffset.x + self.bounds.width * 7 / 19
        
        //        var transform = CATransform3DIdentity
        //        transform.m34 = -1.0 / 500.0
        //        let angle = (scrollView.contentOffset.x) / CGFloat(202) * CGFloat(45.0 / 180.0 * M_PI)
        //        let z = (scrollView.contentOffset.x) / CGFloat(202) * CGFloat(123.0)
        //        transform = CATransform3DTranslate(transform, 0, 0, z)
        
        //        self.leftGame.layer.transform = CATransform3DRotate(transform, angle, 0, 1, 0)
        
        AnimationHelper.perspectiveTransformForContainerView(leftleftGame, contentOffset: scrollView.contentOffset.x + invisibleScrollView.frame.width)
        AnimationHelper.perspectiveTransformForContainerView(leftGame, contentOffset: scrollView.contentOffset.x)
        AnimationHelper.perspectiveTransformForContainerView(currentGame, contentOffset: scrollView.contentOffset.x - invisibleScrollView.frame.width)
        AnimationHelper.perspectiveTransformForContainerView(rightGame, contentOffset: scrollView.contentOffset.x - invisibleScrollView.frame.width * 2)
        AnimationHelper.perspectiveTransformForContainerView(rightrightGame, contentOffset: scrollView.contentOffset.x - invisibleScrollView.frame.width * 3)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        scrollDidStop()
    }
    
    private func scrollDidStop() {
        
        let index = scrollView.contentOffset.x / UIScreen.main.bounds.width
        if index == 1 {
            return
        }
        
        if direction == .right {
            currentIndex = rightIndex
        } else if direction == .left {
            currentIndex = leftIndex
        }
        
        self.direction = .none
        
        
        if currentIndex < gameData.count - 1 {
            rightIndex = currentIndex + 1
        } else {
            rightIndex = 0
        }
        
        if currentIndex > 0 {
            leftIndex = currentIndex - 1
        } else {
            leftIndex = gameData.count - 1
        }
        
        pageControl.currentPage = currentIndex
        scrollView.contentOffset = CGPoint(x: self.bounds.width, y: scrollView.contentOffset.y)
        invisibleScrollView.contentOffset = CGPoint(x: self.bounds.width * 12 / 19, y: scrollView.contentOffset.y)
    }
}


