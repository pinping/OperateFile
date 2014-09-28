

Pod::Spec.new do |s|

  s.name         = "OperateFile"
  s.version      = "0.0.1"
  s.summary      = "A short description of OperateFile."
  s.description  = <<-DESC
                   A longer description of OperateFile in Markdown format.

                   * Think: Why did you write this? What is the focus? What does it do?
                   * CocoaPods will be using this to generate tags, and improve search results.
                   * Try to keep it short, snappy and to the point.
                   * Finally, don't worry about the indent, CocoaPods strips it!
                   DESC
  s.homepage     = "https://github.com/pinping/OperateFile"
  s.license      = "MIT"
  s.author             = { "pinping" => "377795496@163.com" }
  s.source       = { :git => "https://github.com/pinping/OperateFile.git", :tag => "0.0.1" }
  s.framework = 'UIKit'
　s.requires_arc = true
  s.platform = :ios
  s.source_files  = 'OperateFile/*.{h,m}'
end

