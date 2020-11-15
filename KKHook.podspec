#
# Be sure to run `pod lib lint KKHook.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'KKHook'
  s.version          = '0.3.1'
  s.summary          = 'A short description of KKHook.'
  
  s.pod_target_xcconfig = { 'VALID_ARCHS' => 'x86_64 arm64' }

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/rykeryin/KKHook'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'rykeryin' => 'rykeryin@163.com' }
  s.source           = { :git => 'https://github.com/rykeryin/KKHook.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'KKHook/Classes/**/*'
  
  # 第三方非开源framework(多个)
#     s.vendored_frameworks = [
#                             'KKHook/Classes/Dobby.framework'
#                             ]
  
  # s.resource_bundles = {
  #   'KKHook' => ['KKHook/Assets/*.png']
  # }

#   s.public_header_files = 'KKHook/Classes/**/*.{h}'
   s.vendored_libraries = "KKHook/Classes/libDobby.a"
   
#   s.dependency 'Dobby', :path => 'KKHook/Classes/'
  # s.dependency 'AFNetworking', '~> 2.3'
end
