#
# Be sure to run `pod lib lint GNKeyboardAwareScrollView.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "GNKeyboardAwareScrollView"
  s.version          = "0.1.1"
  s.summary          = "UIScrollView subclass for handling content inset by keyboard."
  s.description      = <<-DESC
                       UIScrollView subclass wich handles content insets automaticaly with keyboard appearance.
                       DESC
  s.homepage         = "https://github.com/jakubknejzlik/GNKeyboardAwareScrollView"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Jakub Knejzlik" => "jakub.knejzlik@gmail.com" }
  s.source           = { :git => "https://github.com/jakubknejzlik/GNKeyboardAwareScrollView.git", :tag => s.version.to_s }

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'GNKeyboardAwareScrollView' => ['Pod/Assets/*.png']
  }

  s.frameworks = 'UIKit'
end
