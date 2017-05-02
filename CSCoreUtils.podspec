#
# Be sure to run `pod lib lint CSCoreUtils.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CSCoreUtils'
  s.version          = '0.1.3'
  s.summary          = 'A short description of CSCoreUtils.'

  s.description      = <<-DESC
                    常用工具整合框架
                       DESC

  s.homepage         = 'https://github.com/wleics/CSCoreUtils'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'wleics' => 'wleics@163.com' }
  s.source           = { :git => 'https://github.com/wleics/CSCoreUtils.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'CSCoreUtils/Classes/**/*'
  
  s.resource_bundles = {
    #'CSCoreUtils' => ['CSCoreUtils/Assets/*.png']
    'CSCoreUtils' => ['CSCoreUtils/Assets/*']
  }

  s.public_header_files = 'CSCoreUtils/Classes/**/*.h'
  s.frameworks = 'UIKit', 'SystemConfiguration','MobileCoreServices'
  s.dependency 'AFNetworking', '~> 3.1'
  s.dependency 'MJExtension'
end
