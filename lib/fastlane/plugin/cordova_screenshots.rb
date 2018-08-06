require 'fastlane/plugin/cordova_screenshots/version'
require 'fastlane/plugin/cordova_screenshots/constants'

module Fastlane
  module CordovaScreenshots
    # Return all .rb files inside the "actions" and "helper" directory
    def self.all_classes
      Dir[File.expand_path('**/{actions,helper}/*.rb', File.dirname(__FILE__))]
    end
  end
end

# By default we want to import all available actions and helpers
# A plugin can contain any number of actions and plugins
Fastlane::CordovaScreenshots.all_classes.each do |current|
  require current
end
