
Pod::Spec.new do |s|
  s.name         = "RNCountdownButton"
  s.version      = "1.0.0"
  s.summary      = "一个用于获取验证码的倒计时按钮"
  s.description  = "一个用于获取验证码的倒计时按钮.."
  s.homepage     = "https://github.com/rainedAllNight/RNCountdownButton"

  s.license      = "MIT"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "罗伟" => "18356285339@163.com" }

  s.ios.deployment_target  = '8.0'
  s.requires_arc = true

  s.source       = { :git => "https://github.com/rainedAllNight/RNCountdownButton.git", :tag => "#{s.version}" }
  s.source_files  = "RNCountdownButton/*.{swift}"
 

end
