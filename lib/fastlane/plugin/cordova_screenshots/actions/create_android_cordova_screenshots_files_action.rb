require 'fastlane/plugin/cordova_screenshots/constants'

module Fastlane
  module Actions

    class CreateAndroidCordovaScreenshotsFilesAction < Action
      def self.run(params)       
        #
        # Copy over unit test files
        #
        UI.message("Creating new Android tests in '#{CordovaScreenshots::IONIC_ANDROID_CONFIG_PATH}'")
        Fastlane::Helper::CordovaScreenshotsHelper.copy_android_sample_test
        # TODO Don't overwrite existing files!
        
        UI.success("Created Android test. Call the `retrofit_android_cordova_screenshots` action to integrate it into your Android project.")
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
        []
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
