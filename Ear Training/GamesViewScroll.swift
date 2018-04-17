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
    fileprivate var gameWidth: CGFloat = 0
    fileprivate var gameHeight: CGFloat = 0
    fileprivate var scrollWidth: CGFloat = 0
    fileprivate var currentGmaeXCoordinate:CGFloat = 0
    fileprivate var rotateFix: CGFloat = 0
    
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
        return scrollView
    }()
    
    fileprivate lazy var invisibleScrollView: UIScrollView = {
        let invisibleScrollView = UIScrollView.init(frame: CGRect(x: self.bounds.width - self.scrollWidth,
                                                                  y: self.bounds.minY,
                                                                  width: self.scrollWidth,
                                                                  height: self.bounds.height - 20))
        invisibleScrollView.contentSize = CGSize(width: self.scrollWidth * 3,
                                                 height: invisibleScrollView.contentSize.height)
        invisibleScrollView.contentOffset = CGPoint(x: self.scrollWidth, y: 0)
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
        let currentGame = GameView.init(frame: CGRect(x: self.currentGmaeXCoordinate,
                                                      y: self.bounds.height / 8,
                                                      width: self.gameWidth,
                                                      height: self.gameWidth))

        AnimationHelper.perspectiveTransformForContainerView(currentGame, scale: 0)
        currentGame.imageView.image = self.gameData[0].image
        currentGame.titleImage.image = self.gameData[0].titleImage
        
        return currentGame
    }()
    
    fileprivate lazy var leftGame: GameView = {
        let leftGame = GameView.init(frame: CGRect(x: self.currentGmaeXCoordinate - self.scrollWidth,
                                                   y: self.bounds.height / 8,
                                                   width: self.gameWidth,
                                                   height: self.gameWidth))
    
        AnimationHelper.perspectiveTransformForContainerView(leftGame, scale: 1)
        leftGame.imageView.image = self.gameData[self.gameData.count - 1].image
        leftGame.titleImage.image = self.gameData[self.gameData.count - 1].titleImage
        leftGame.titleImage.alpha = 0
        
        return leftGame
    }()
    
    fileprivate lazy var leftleftGame: GameView = {
        let leftleftGame = GameView.init(frame: CGRect(x: self.currentGmaeXCoordinate - self.scrollWidth * 2 ,
                                                       y: self.bounds.height / 8,
                                                       width: self.gameWidth,
                                                       height: self.gameWidth))
        
        leftleftGame.imageView.image = self.gameData[self.gameData.count - 2].image
        
        return leftleftGame
    }()
    
    fileprivate lazy var rightGame: GameView = {
        let rightGame = GameView.init(frame: CGRect(x: self.currentGmaeXCoordinate + self.scrollWidth,
                                                    y: self.bounds.height / 8,
                                                    width: self.gameWidth,
                                                    height: self.gameWidth))

        AnimationHelper.perspectiveTransformForContainerView(rightGame, scale: -1)
        rightGame.imageView.image = self.gameData[1].image
        rightGame.titleImage.image = self.gameData[1].titleImage
        rightGame.titleImage.alpha = 0
        return rightGame
    }()
    
    fileprivate lazy var rightrightGame: GameView = {
        let rightrightGame = GameView.init(frame: CGRect(x: self.currentGmaeXCoordinate + self.scrollWidth * 2,
                                                         y: self.bounds.height / 8,
                                                         width: self.gameWidth,
                                                         height: self.gameWidth))

        rightrightGame.imageView.image = self.gameData[1].image
        
        
        return rightrightGame
    }()
    
    fileprivate lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl.init(frame: CGRect(x: self.bounds.width / 2 - 50,
                                                           y: self.bounds.maxY * 3 / 2 - 20,
                                                           width: 100,
                                                           height: 20))
        pageControl.numberOfPages = self.gameData.count
        pageControl.pageIndicatorTintColor = UIColor.pagesIndicator
        pageControl.currentPageIndicatorTintColor = UIColor.white
        
        return pageControl
    }()
    
    var currentIndex = 0 {
        didSet {
            
            currentGame.imageView.image = gameData[currentIndex].image
            currentGame.titleImage.image = gameData[currentIndex].titleImage
        }
    }
    fileprivate var leftIndex = 2 {
        didSet {
            
            leftGame.imageView.image = self.gameData[leftIndex].image
            leftGame.titleImage.image = gameData[leftIndex].titleImage
        }
    }
    fileprivate var rightIndex = 1 {
        didSet {
            
            rightGame.imageView.image = self.gameData[rightIndex].image
            rightGame.titleImage.image = gameData[rightIndex].titleImage
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
        
        gameWidth = self.bounds.width * 46.7 / 138
        gameHeight = self.bounds.height * 0.8
        currentGmaeXCoordinate = self.bounds.width * 2 - (self.bounds.width * 84 / 138 + self.bounds.width * 8.3 / 138)
        rotateFix = self.bounds.width * 13 / 138
        scrollWidth = self.bounds.width * 84 / 138 - rotateFix
        
        addSubview(scrollView)
        
        scrollView.addSubview(leftleftGame)
        scrollView.addSubview(leftGame)
        scrollView.addSubview(currentGame)
        scrollView.addSubview(rightGame)
        scrollView.addSubview(rightrightGame)
        
        addSubview(invisibleScrollView)
        scrollView.addGestureRecognizer(invisibleScrollView.panGestureRecognizer)
        
        addSubview(pageControl)
    }
}

extension GamesViewScroll: UIScrollViewDelegate {
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let rotatingScale = scrollView.contentOffset.x / invisibleScrollView.frame.width
        
        direction = invisibleScrollView.contentOffset.x > self.scrollWidth ? .left : .right
        self.scrollView.contentOffset.x = invisibleScrollView.contentOffset.x + (self.bounds.width - self.scrollWidth)

        AnimationHelper.perspectiveTransformForContainerView(leftleftGame, scale: rotatingScale + 1)
        AnimationHelper.perspectiveTransformForContainerView(leftGame, scale: rotatingScale)
        AnimationHelper.perspectiveTransformForContainerView(currentGame, scale: rotatingScale - 1)
        AnimationHelper.perspectiveTransformForContainerView(rightGame, scale: rotatingScale - 2)
        AnimationHelper.perspectiveTransformForContainerView(rightrightGame, scale: rotatingScale - 3)
        
        if direction == .right {
            leftGame.titleImage.alpha = 1 - rotatingScale
            currentGame.titleImage.alpha = rotatingScale
            rightGame.titleImage.alpha = 0
        } else if direction == .left {
            leftGame.titleImage.alpha = 0
            currentGame.titleImage.alpha = 2 - rotatingScale
            rightGame.titleImage.alpha = rotatingScale - 1
        }

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
            currentIndex = leftIndex
        } else if direction == .left {
            currentIndex = rightIndex
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
        invisibleScrollView.contentOffset = CGPoint(x: self.scrollWidth, y: scrollView.contentOffset.y)
    }
}


