#
# Be sure to run `pod lib lint CSCoreUtils.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CSCoreUtils'
  s.version          = '0.1.5'
  s.summary          = 'A short description of CSCoreUtils.'

  s.description      = <<-DESC
                    常用工具整合框架
                       DESC

  s.homepage         = 'https://github.com/wleics/CSCoreUtils'
  s.license          = 'MIT'
  s.author           = { 'wleics' => 'wleics@163.com' }
  s.source           = { :git => 'https://github.com/wleics/CSCoreUtils.git', :tag => '0.1.5' }

  s.ios.deployment_target = '8.0'
  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'CSCoreUtils/Classes/**/*'
  
  s.resource_bundles = {
    'CSCoreUtils' => ['CSCoreUtils/Assets/*']
  }

  s.public_header_files = 'CSCoreUtils/Classes/**/*.h'
  s.frameworks = 'UIKit', 'SystemConfiguration','MobileCoreServices'
  #s.libraries  = 'z.1'
  s.dependency 'AFNetworking', '~> 3.1'
  s.dependency 'MJExtension'
  s.dependency 'YYWebImage'
  s.dependency 'pop', '~> 1.0'
end
