# RNCountdownButton
a custom countdown button（一个自定义的倒计时按钮）

## 效果图
![效果图](https://github.com/rainedAllNight/RNCountdownButtonExample/commit/9c8d15cf348d7b3562aafac0e8a79d13ee680eab)

## How To Use

* ### 继承RNCountDownButton，并将button的类型设置为custom

* ### 提供了三个代理方法
    //倒计时已经开始
@objc optional func countdownButtonDidStarted(countdownButton: RNCountDownButton)

    //倒计时已经结束
@objc optional func countdownButtonDidStarted(countdownButton: RNCountDownButton)

    //秒数已经更新
@objc optional func countdownButton(countdownButton: RNCountDownButton, didUpdatedWith second: Int)

* ### 属性设置
    //总的倒计时时间，默认为60s
var RNCountDownNumber = 60

    

