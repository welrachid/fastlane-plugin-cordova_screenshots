require 'xcodeproj'
require 'fastlane/plugin/cordova_screenshots/constants'

module Fastlane
  module Actions
    class InitCordovaScreenshotsIosAction < Action
      def self.run(params)
        scheme_name = params[:scheme_name]

        UI.message("Creating new iOS UI Unit Test (with scheme '#{scheme_name}') in '#{CordovaScreenshots::CORDOVA_SCREENSHOTS_IOS_CONFIG_PATH}'")
        Fastlane::Helper::CordovaScreenshotsHelper.copy_ios_sample_tests(scheme_name)

        UI.success("Done. Call the `retrofit_cordova_screenshots_ios` action to integrate it into your Cordova iOS Xcode project.")
      end

      def self.description
        "Creates an iOS UI Unit Tests in '#{CordovaScreenshots::CORDOVA_SCREENSHOTS_IOS_CONFIG_PATH}'"
      end

      def self.authors
        ['Adrian Regan', 'Jan Piotrowski']
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.details
        # Optional:
        ""
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :scheme_name,
                                       env_name: 'CORDOVA_SCREENSHOTS_IOS_TEST_SCHEME',
                                       description: 'Scheme Name of the UI Unit Tests',
                                       default_value: CordovaScreenshots::CORDOVA_SCREENSHOTS_DEFAULT_IOS_UNIT_TEST_NAME,
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
