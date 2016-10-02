platform :ios, :deployment_target => "9.0"
use_frameworks!

pod 'Flurry-iOS-SDK/FlurrySDK'
pod 'Appirater', '~> 2.0.4'
pod 'Google-Mobile-Ads-SDK', '~> 7.5'
pod 'Firebase/Core'
pod 'Fabric'
pod 'Crashlytics'
pod 'TPKeyboardAvoiding', '~>1.3'
pod 'Firebase/Core'
pod 'Mixpanel'
pod 'Fabric'
pod 'Crashlytics'
pod 'VENCalculatorInputView', '~> 1.5'
pod 'Alamofire', '~> 4.0'

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '3.0'
        end
    end
end
