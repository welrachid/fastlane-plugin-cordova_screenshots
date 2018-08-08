require 'fastlane/plugin/cordova_screenshots/constants'

module Fastlane
  module Actions

    class CreateAndroidCordovaScreenshotsFilesAction < Action
      def self.run(params)       
        package_name = params[:package_name]

        UI.message("Creating new Android UI test in '#{CordovaScreenshots::IONIC_ANDROID_CONFIG_PATH}'")
        Fastlane::Helper::CordovaScreenshotsHelper.copy_android_sample_test(package_name)
        
        UI.success("Created Android UI test. Call the `retrofit_android_cordova_screenshots` action to integrate it into your Android project.")
      end

      def self.description
        "Creates a sample Android test file in '#{CordovaScreenshots::IONIC_ANDROID_CONFIG_PATH}'"
      end

      def self.authors
        ['Jan Piotrowski']
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.details
        # Optional:
        ''
      end

      def self.available_options
        [
            FastlaneCore::ConfigItem.new(key: :package_name,
                env_name: 'CORDOVA_SCREENSHOTS_PACKAGE_NAME',
                description: "The package name of the app under test (e.g. com.yourcompany.yourapp)",
                code_gen_sensitive: true,
                default_value: CredentialsManager::AppfileConfig.try_fetch_value(:package_name),
                optional: false)
        ]
      end

      def self.is_supported?(platform)
        # Adjust this if your plugin only works for a particular platform (iOS vs. Android, for example)
        # See: https://github.com/fastlane/fastlane/blob/master/fastlane/docs/Platforms.md
        #
        # [:ios, :mac, :android].include?(platform)
        [:ios].include?(platform)
      end
    end
  end
end
