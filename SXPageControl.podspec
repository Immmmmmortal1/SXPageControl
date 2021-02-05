
Pod::Spec.new do |s|

s.name         = "SXPageControl"

s.version      = "1.0.0"

s.summary      = "SXPageControl 第一版."

s.description  = <<-DESC

SXpageControl。

DESC

s.homepage     = "https://github.com/Immmmmmortal1/SXPageControl"

s.license      = { :type => "MIT", :file => "LICENSE" }

s.author             = { "树下" => "1347715389@qq.com" }

s.platform     = :ios, "7.0"

s.source       = { :git => "https://github.com/Immmmmmortal1/SXPageControl.git", :tag => s.version }

s.source_files  = "SXPageControl/SXPageControl/Classes/**/*.{h,m}"

s.requires_arc = true

end
