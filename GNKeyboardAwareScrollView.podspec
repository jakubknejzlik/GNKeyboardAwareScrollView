#
#  Be sure to run `pod spec lint GNKeyboardAwareScrollView.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
  s.name         = "GNKeyboardAwareScrollView"
  s.version      = "0.0.1"
  s.summary      = "A short description of GNKeyboardAwareScrollView."
  s.description  = <<-DESC
					UIScrollView subclass wich handles content insets automaticaly with keyboard appearance.
                   DESC
  s.homepage     = "https://github.com/jakubknejzlik/GNKeyboardAwareScrollView"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Jakub Knejzlik" => "jakub.knejzlik@gmail.com" }
  s.platform     = :ios, "6.0"
  s.source       = { :git => "https://github.com/jakubknejzlik/GNKeyboardAwareScrollView.git", :tag => "0.0.1" }
  s.source_files  = "GNKeyboardAwareScrollView/*.{h,m}"
  s.framework  = "UIKit"
  s.requires_arc = true
end
