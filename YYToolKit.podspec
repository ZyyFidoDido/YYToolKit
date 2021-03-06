#
# Be sure to run `pod lib lint YYToolKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'YYToolKit'
  s.version          = '1.1.3'
  s.summary          = 'YYToolKit is a Private Tool.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: YYToolKit is a Private Tool.Not necessarily good For you.
                       DESC

  s.homepage         = 'https://github.com/ZyyFidoDido/YYToolKit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'ZyyFidoDido' => '283735151@qq.com' }
  s.source           = { :git => 'https://github.com/ZyyFidoDido/YYToolKit.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'YYToolKit/Classes/**/*.{h,m}'
  
  # s.resource_bundles = {
  #   'YYToolKit' => ['YYToolKit/Assets/*.png']
  # }

  s.swift_version = '4.0'
  s.requires_arc = true
#   s.public_header_files = 'Pod/Classes/**/*.h'
   s.frameworks = 'UIKit','Foundation'
   s.dependency 'AFNetworking', '~> 3.2.1'
   s.dependency 'Masonry', '~> 1.1.0'
   s.dependency 'BlocksKit'
#   , '~> 2.2.5'
   s.dependency 'MBProgressHUD'
#   s.dependency 'ReactiveCocoa',:git => 'https://github.com/zhao0/ReactiveCocoa.git', :tag => '2.5.2'
  s.dependency 'ReactiveObjC', '~> 3.1.0'
  s.dependency 'PREBorderView', '~> 3.2.2'
  s.dependency 'pop', '~> 1.0.12'
   
end
