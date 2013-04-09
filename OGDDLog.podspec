Pod::Spec.new do |s|
  s.name         = "OGDDLog"
  s.version      = "1.0.0"
  s.summary      = "Some helpers and a custom log formatter for CocoaLumberjack."
  # s.description  = <<-DESC
  #                   An optional longer description of OGDDLog
  #
  #                   * Markdown format.
  #                   * Don't worry about the indent, we strip it!
  #                  DESC
  s.homepage     = "http://github.com/GregOriol/OGDDLog"
  s.license  = { :type => 'BSD', :file => 'LICENSE.txt' }
  s.author       = { "Greg ORIOL" => "" }
  s.source       = { :git => "https://github.com/GregOriol/OGDDLog.git", :tag => "1.0.0" }
  s.platform     = :ios, '4.3'
  s.source_files = '*.{h,m}'
  s.requires_arc = true
  s.dependency 'CocoaLumberjack', '~> 1.6.2'
end
