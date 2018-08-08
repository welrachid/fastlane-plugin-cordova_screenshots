require 'xcodeproj'

module Fastlane
  module Actions
    class RetrofitAndroidCordovaScreenshotsAction < Action
      def self.run(params)
        UI.message "RetrofitAndroidCordovaScreenshotsAction"
        package_name = params[:package_name]
        package_name_path = package_name.gsub('.', '/')

        # copy over test file to `platforms\android\app\src\androidTest\java\...\ScreengrabTest.java` (... = io\ionic\starter)
        Fastlane::Helper::CordovaScreenshotsHelper.copy_android_test_file(package_name_path, package_name)

        # copy over build-extras.gradle to `platforms\android\app`
        Fastlane::Helper::CordovaScreenshotsHelper.copy_android_build_extras_gradle

        # copy over AndroidManifest.xml to `platforms\android\app\src\debug`
        Fastlane::Helper::CordovaScreenshotsHelper.copy_android_manifest(package_name)

      end

      def self.description
        'Retrofit test into Android project'
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
                env_name: 'CORDOVA_SCREENSHOTS_APP_PACKAGE_NAME',
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
