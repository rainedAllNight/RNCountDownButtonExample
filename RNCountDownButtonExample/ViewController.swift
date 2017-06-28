//
//  ViewController.swift
//  RNCountDownButtonExample
//
//  Created by rainedAllNight on 2017/1/26.
//  Copyright © 2017年 罗伟. All rights reserved.
//

import UIKit

class ViewController: UIViewController, RNCountdownButtonDelegate {
    
    @IBOutlet weak var countDownButton: RNCountdownButton!
    @IBOutlet weak var countLabel: UILabel!
    
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.countDownButton.delegate = self
        self.countDownButton.isEnabled = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - IBAction
    
    @IBAction func handleCountDownButtonAction(_ sender: Any) {
        self.countDownButton.start()
    }
    
    // MARK: - RNCountdownButtonDelegate
    func countdownButtonDidBeganCounting(countdownButton: RNCountdownButton) {
        self.countLabel.text = "倒计时已经开始"
    }
    
    func countdownButtonDidEndCounting(countdownButton: RNCountdownButton) {
        self.countLabel.text = "倒计时已经结束"
    }

    func countdownButton(countdownButton: RNCountdownButton, didUpdatedWith seconds: Int) {
        self.countLabel.text = "剩余\(seconds)秒"
    }
    
}

