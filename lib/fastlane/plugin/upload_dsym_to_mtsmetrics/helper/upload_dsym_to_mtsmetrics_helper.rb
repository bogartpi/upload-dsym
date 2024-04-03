require 'fastlane_core/ui/ui'

module Fastlane
  UI = FastlaneCore::UI unless Fastlane.const_defined?(:UI)

  module Helper
    class UploadDsymToMtsmetricsHelper
      # class methods that you define here become available in your action
      # as `Helper::UploadDsymToMtsmetricsHelper.your_method`
      #
      def self.show_message
        UI.message("Hello from the upload_dsym_to_mtsmetrics plugin helper!")
      end
    end
  end
end
