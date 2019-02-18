#
# Be sure to run `pod lib lint CnXVersioner.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CnXVersioner'
  s.version          = '0.0.2'
  s.summary          = 'Simple iOS App version manager for showing onboard view.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Simple iOS App version manager for showing onboard view.

it initialized from AppDelegate and Save version info into UserDefaults.
You can use for showing onboard view easily.
                       DESC

  s.homepage         = 'https://github.com/CenoX/CnXVersioner'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'CenoX' => 'dev@cenox.co' }
  s.source           = { :git => 'https://github.com/CenoX/CnXVersioner.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/CenoX_Kang'

  s.ios.deployment_target = '12.0'
  s.swift_version = '4.2'

  s.source_files = 'CnXVersioner/Classes/**/*'
  s.frameworks = 'UIKit'
end
