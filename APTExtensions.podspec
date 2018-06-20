Pod::Spec.new do |s|
  s.name             = 'APTExtensions'
  s.version          = '0.1.0'
  s.summary          = 'Useful extensions for swift'
  s.swift_version      = "4.0"
  s.description      = <<-DESC
Useful extensions for UIView, String etc.
                       DESC

  s.homepage         = 'https://github.com/rishadappat/APTExtensions'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Rishad Appat' => 'rishadappat@gmail.com' }
  s.source           = { :git => 'https://github.com/rishadappat/APTExtensions.git', :tag => "#{s.version}" }

  s.ios.deployment_target = '10.0'
  s.source_files = "APTExtensions/*.{swift,plist,h}"

end
