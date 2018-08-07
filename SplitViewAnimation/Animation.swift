//
//  Animation.swift
//  SplitViewAnimation
//
//  Created by issam on 06/08/2018.
//  Copyright © 2018 ZetaLearning Inc. All rights reserved.
//

import Cocoa

class Animation: NSAnimation {
    var splitView:NSSplitView!
    var dividerAtIndex:Int!
    var startPosition:CGFloat!
    var endPosition:CGFloat!
    typealias CompletionBlock = () -> Void
    var completionBlock:CompletionBlock!
    override init(duration: TimeInterval, animationCurve: NSAnimation.Curve) {
        super.init(duration: duration, animationCurve: animationCurve)
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    convenience init(splitView:NSSplitView, dividerAtIndex:Int,from startPosition:CGFloat, to endPosition:CGFloat, completionBlock:@escaping CompletionBlock) {
        self.init(duration: 0.5, animationCurve: .linear)
        self.splitView = splitView
        self.dividerAtIndex = dividerAtIndex
        self.startPosition = startPosition
        self.endPosition = endPosition
        self.completionBlock = completionBlock
        self.animationBlockingMode = NSAnimation.BlockingMode.blocking
        self.frameRate = 30.0
    }
    override var currentProgress: NSAnimation.Progress{
        didSet{
            let newPosition = self.startPosition + ((self.endPosition - self.startPosition) * CGFloat(currentProgress))
            self.splitView.setPosition(newPosition, ofDividerAt: self.dividerAtIndex)
            if currentProgress == 1.0 {
                self.completionBlock()
            }
        }
    }
}
