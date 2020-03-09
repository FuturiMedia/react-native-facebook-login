require "json"

Pod::Spec.new do |s|
  # NPM package specification
  package = JSON.parse(File.read(File.join(File.dirname(__FILE__), "package.json")))

  s.name         = "ReactNativeFacebookLogin"
  s.version      = package["version"]
  s.summary      = package["description"]
  s.homepage     = package["homepage"]
  s.license      = "MIT"
  s.author       = { "Ryan Sjoquist" => "ryan.sjoquist@gmail.com" }
  s.platforms    = { :ios => "9.0", :tvos => "9.0" }
  s.source       = { :git => package["repository"]["url"], :tag => "#{s.version}" }
  s.source_files = "RCTFBLogin/*.{h,m}"
  
  s.dependency "React"
  s.pod_target_xcconfig    = {
    'FRAMEWORK_SEARCH_PATHS' => '"$(SRCROOT)/../node_modules/react-native-facebook-login/FacebookSDK"',
  }

end
