Pod::Spec.new do |s|
  s.name             = "UCTransitWidgets"
  s.version          = "0.1.3"
  s.summary          = "A small library to display resolution-independent transit line icons."
  s.description      = <<-DESC
                       UCTransitWidgets is a small library to help display accurately-styled, resolution-independent icons for various transit systems. It currently supports the NYC subway and the DC metro.
                       DESC
  s.homepage         = "https://github.com/UrbanCompass/UCTransitWidgets"
  s.license          = 'MIT'
  s.authors          = { "Jerry Wong" => "jerry@compass.com", "James Paolantonio"=> "jamesp@compass.com" }
  s.source           = { :git => "https://github.com/UrbanCompass/UCTransitWidgets.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/potatolicious'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'UCTransitWidgets'
  s.public_header_files = 'UCTransitWidgets/**/*.h'

  s.frameworks = 'UIKit'
end
