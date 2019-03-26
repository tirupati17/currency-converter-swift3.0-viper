platform :ios, :deployment_target => "9.0"
use_frameworks!

def pods
    pod 'Appirater'
    pod 'Refresher'
    pod 'Mixpanel-swift'
    pod 'UserExperior', '4.0.2' #Crash report along with user session video recording. Find out more at https://www.userexperior.com/
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
