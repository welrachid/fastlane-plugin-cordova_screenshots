require 'xcodeproj'
require 'fastlane/plugin/cordova_screenshots/constants'

module Fastlane
  module Actions
    #
    # Used to bootstrap the UI Unit Testing Process for iOS generated Xcode Projects.
    #
    # It copies over a sample UI test to our fastlane config folder
    #
    class IonicIosConfigSnapshotAction < Action
      def self.run(params)
        #
        # Params
        #
        scheme_name = params[:ionic_scheme_name]
        
        #
        # Copy over unit test files
        #
        UI.message("Creating New UI Unit Tests for Snapshots, with Scheme '#{scheme_name}' in '#{CordovaScreenshots::IONIC_IOS_CONFIG_PATH}'")
        Fastlane::Helper::CordovaScreenshotsHelper.copy_ios_sample_tests(scheme_name)
        # TODO Don't overwrite existing files
        
        UI.success("Created UI Test Configuration. Call the `ionic_ios_snapshot` action to integrate it into your Xcode project.")
      end

      def self.description
        'Create a Sample iOS UI Unit Test to get started with in a generated Cordova/Ionic project'
      end

      def self.authors
        ['Adrian Regan', 'Jan Piotrowski']
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.details
        # Optional:
        "Creates a set of UI Unit Tests in '#{CordovaScreenshots::IONIC_IOS_CONFIG_PATH}'"
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :ionic_scheme_name,
                                       env_name: 'IONIC_IOS_TEST_SCHEME',
                                       description: 'Scheme Name of the UI Unit Tests',
                                       default_value: CordovaScreenshots::IONIC_DEFAULT_UNIT_TEST_NAME,
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
