Pod::Spec.new do |s|
  s.name         = "GNKeyboardAwareScrollView"
  s.version      = "0.0.1"
  s.summary      = "UIScrollView subclass for handling content inset by keyboard."
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
