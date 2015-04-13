#
# Be sure to run `pod lib lint UCTransitWidgets.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "UCTransitWidgets"
  s.version          = "0.1.0"
  s.summary          = "A small library to display resolution-independent transit line icons."
  s.description      = <<-DESC
                       UCTransitWidgets is a small library to help display accurately-styled, resolution-independent icons for various transit systems. It currently supports the NYC subway and the DC metro.
                       DESC
  s.homepage         = "https://github.com/UrbanCompass/UCTransitWidgets"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Jerry Wong" => "jerry.wong@urbancompass.com" }
  s.source           = { :git => "https://github.com/UrbanCompass/UCTransitWidgets.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/compassinc'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes'
  s.resource_bundles = {
    'UCTransitWidgets' => ['Pod/Assets/*.png']
  }

  s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
