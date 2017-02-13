//
//  ViewController.swift
//  RNCountDownButtonExample
//
//  Created by rainedAllNight on 2017/1/26.
//  Copyright © 2017年 罗伟. All rights reserved.
//

import UIKit

class ViewController: UIViewController, RNCountDownButtonDelegate {
    
    @IBOutlet weak var countDownButton: RNCountDownButton!
    @IBOutlet weak var countLabel: UILabel!
    
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.countDownButton.delegate = self
        self.countDownButton.layer.cornerRadius = self.countDownButton.frame.height/2
        self.countDownButton.layer.masksToBounds = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - IBAction
    
    @IBAction func handleCountDownButtonAction(_ sender: Any) {
        self.countDownButton.start()
    }
    
    // MARK: - RNCountDownButtonDelegate
    
    func countdownButtonDidStarted(countdownButton: RNCountDownButton) {
        self.countLabel.text = "倒计时已经开始"
    }
    
    func countdownButton(countdownButton: RNCountDownButton, didUpdatedWith second: Int) {
        self.countLabel.text = "剩余\(second)秒"
    }
    
    func countdownButtonDidStoped(countdownButton: RNCountDownButton) {
        self.countLabel.text = "倒计时已经结束"
    }
}

