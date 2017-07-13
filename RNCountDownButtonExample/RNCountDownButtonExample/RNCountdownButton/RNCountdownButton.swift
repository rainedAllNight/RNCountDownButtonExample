//
//  RNCountDownButton.swift
//  RNCountDownButtonExample
//(重要：一定要把buttonType设置成custom)
//  Created by rainedAllNight on 2017/1/24.
//  Copyright © 2017年 罗伟. All rights reserved.
//

import UIKit

@objc public protocol RNCountdownButtonDelegate: NSObjectProtocol {
    // called when seconds update
    @objc optional func countdownButton(countdownButton: RNCountdownButton, didUpdatedWith seconds: Int)
    
    // called when the Countdown begin
    @objc optional func countdownButtonDidBeganCounting(countdownButton: RNCountdownButton)
    
    // called when the Countdown to the end
    @objc optional func countdownButtonDidEndCounting(countdownButton: RNCountdownButton)
}

open class RNCountdownButton: UIButton {
    @IBInspectable open var maxCountingSeconds: Int = 10
    @IBInspectable open var bgColorForEnable: UIColor?
    @IBInspectable open var bgColorForDisable: UIColor?
    @IBInspectable open var borderColorForEnable: UIColor?
    @IBInspectable open var borderColorForDisable: UIColor?
    @IBInspectable open var titleColorForEnable: UIColor?
    @IBInspectable open var titleColorForDisable: UIColor?
    @IBInspectable open var titleColorForCountingDisable: UIColor?
    
    public var timer: Timer?
    open weak var delegate: RNCountdownButtonDelegate?
    public var isCounting: Bool = false //是否正在倒计时
    
    public var remainingSeconds: Int = 0 {
        willSet {
            self.isCounting = true
            self.delegate?.countdownButton?(countdownButton: self, didUpdatedWith: newValue)
            if newValue <= 0 {
                self.setTitle("重新发送", for: UIControlState())
                self.stop()
                self.isEnabled = true
            } else {
                self.setTitle("已发送(\(newValue))", for: UIControlState())
            }
        }
    }
    
    public func start() {
        self.remainingSeconds = self.maxCountingSeconds
        weak var weakSelf = self
        if #available(iOS 10.0, *) {
            self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (timer) in
                weakSelf?.updateTime()
            })
        } else {
            self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        }
        
        self.delegate?.countdownButtonDidBeganCounting?(countdownButton: self)
        self.isEnabled = false
    }
    
    public func showSending() {
        self.setTitle("发送中..", for: .normal)
    }
    
    public func showFetchAgain() {
        self.setTitle("重新获取", for: .normal)
    }
    
    public func stop() {
        self.timer?.invalidate()
        self.timer = nil
        self.isCounting = false
        self.delegate?.countdownButtonDidEndCounting?(countdownButton: self)
    }
    
    
    @objc private func updateTime() {
        self.remainingSeconds -= 1
    }
    
    override open func awakeFromNib() {
        super.awakeFromNib()
        configUI()
    }
    
    func configUI() {
        self.layoutIfNeeded()
        self.layer.borderWidth = 1.0
        self.layer.cornerRadius = self.frame.size.height/2
        self.layer.masksToBounds = true
        self.isEnabled = false
        self.isCounting = false
    }
    
    open override var isEnabled: Bool {
        willSet {
            if newValue {
                self.backgroundColor = self.bgColorForEnable
                self.layer.borderColor = self.borderColorForEnable?.cgColor
                self.setTitleColor(self.titleColorForEnable, for: .normal)
            } else {
                self.backgroundColor = self.bgColorForDisable
                self.layer.borderColor = self.borderColorForDisable?.cgColor
                if self.isCounting {
                    self.setTitleColor(self.titleColorForCountingDisable, for: .normal)
                } else {
                    self.setTitleColor(self.titleColorForDisable, for: .normal)
                }
            }
        }
    }
}



