//
//  RNCountDownButton.swift
//  RNCountDownButtonExample
//
//  Created by rainedAllNight on 2017/1/24.
//  Copyright © 2017年 罗伟. All rights reserved.
//

import UIKit

@objc protocol RNCountDownButtonDelegate {
    @objc optional func countdownButton(countdownButton: RNCountDownButton, didUpdatedWith second: Int)
    @objc optional func countdownButtonDidStarted(countdownButton: RNCountDownButton)
    @objc optional func countdownButtonDidStoped(countdownButton: RNCountDownButton)
}

class RNCountDownButton: UIButton {

    let RNCountDownNumber = 10
    var timer: Timer?
    weak var delegate: RNCountDownButtonDelegate?

    var remainingSeconds: Int = 0 {
        willSet {
            if newValue < 0 {
                self.setTitle("重新发送", for: UIControlState())
                self.stop()
                self.isEnabled = true
            } else {
                self.setTitle("已发送(\(newValue))", for: UIControlState())
                self.delegate?.countdownButton?(countdownButton: self, didUpdatedWith: newValue)
            }
        }
    }
    
    public func start() {
        self.remainingSeconds = RNCountDownNumber
        weak var weakSelf = self
        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (timer) in
             weakSelf?.updateTime()
        })
        self.delegate?.countdownButtonDidStarted?(countdownButton: self)
        self.isEnabled = false
    }
    
    public func stop() {
        self.timer?.invalidate()
        self.timer = nil
        self.delegate?.countdownButtonDidStoped?(countdownButton: self)
    }
    
    private func updateTime() {
        self.remainingSeconds -= 1
    }
    
}

