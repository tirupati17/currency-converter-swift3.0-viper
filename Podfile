platform :ios, :deployment_target => "9.0"
use_frameworks!

def pods
    pod 'Appirater'
    pod 'Alamofire'
    pod 'SwiftyJSON'
    pod 'Refresher'
    pod 'Mixpanel-swift'
    pod 'UserExperior', '3.0.4'
end

target 'CurrencyConverter' do
    pods
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '4.2'
        end
    end
end
