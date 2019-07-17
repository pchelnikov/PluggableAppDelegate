Pod::Spec.new do |s|
  s.name             = 'PluggableAppDelegate'
  s.version          = '1.3.0'
  s.summary          = 'A lightweight service-oriented ApplicationDelegate for iOS, made in Swift.'
  s.description      = 'Using PluggableAppDelegate you separate AppDelegate from the services that you can plug to it. Each ApplicationService has its own life cycle that is shared with AppDelegate.'
  s.homepage         = 'https://github.com/pchelnikov/PluggableAppDelegate'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Michael Pchelnikov' => 'm.pchelnikov@gmail.com' }
  s.source           = { :git => 'https://github.com/pchelnikov/PluggableAppDelegate.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/pchelnikov'
 
  s.swift_version = "5.0"
  s.ios.deployment_target = '9.0'
  s.source_files = 'Sources/**/*.swift'
end