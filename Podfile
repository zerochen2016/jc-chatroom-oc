post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '4.2'
        end
    end
end
use_frameworks!
target 'jc-chatroom-oc' do
    pod 'Socket.IO-Client-Swift', '~> 15.0.0'
end
