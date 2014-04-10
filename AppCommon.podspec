Pod::Spec.new do |s|
  s.name         = "AppCommon"
  s.version      = "0.0.1"
  s.summary      = "App Public content"
  s.homepage     = "https://github.com/kikohz/AppCommon"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "kikohz" => "kikohz@gmail.com" }
  s.social_media_url = "http://twitter.com/H_z2"
  s.platform     = :ios, '5.0'
  s.source       = { :git => "https://github.com/kikohz/AppCommon.git", :tag => "#{s.version}" }

  s.source_files  = 'Source', 'Source/**/*.{h,m}'
  s.exclude_files = 'AppCommon'

  #s.resources = "AppCommon/*.png"
  s.requires_arc = true
end
