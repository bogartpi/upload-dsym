require 'fastlane/action'
require 'fastlane_core'
require 'net/http'
require 'uri'
require_relative '../helper/upload_dsym_to_mtsmetrics_helper'

module Fastlane
  module Actions
    class UploadDsymToMtsmetricsAction < Action
      def self.run(params)
        dsym_path = params[:dsym_path]
        api_key = params[:api_key]
        application_id = params[:application_id]
        build_number = params[:build_number]

        if dsym_path.empty?
          UI.error("dSYM file is not found at path: #{dsym_path}")
          return
        end

        url = URI.parse("https://uat.mtsa.mts.ru/crash-manager/api/v1/mappingfile?" \
                        "applicationId=#{application_id}&" \
                        "buildNumber=#{build_number}&" \
                        "os=ios")
        request = Net::HTTP::Post.new(url)
        request['x-api-key'] = api_key
        request.set_form({ 'mappingFile' => File.open(dsym_path) }, 'multipart/form-data')
        response = Net::HTTP.start(url.host, url.port, use_ssl: true) do |http|
          http.request(request)
        end

        if response.code == '200'
          UI.success("dSYM is successfully uploaded to MTS Metrics 🚀")
        else
          UI.error("Something went wrong during dSYM upload. Status code is #{response.code}")
        end
      end

      def self.description
        "Uploads dSYM files to MTS Metrics"
      end

      def self.validate_api_key(value)
        unless value.kind_of?(String) && value.length == 32
          UI.user_error!("Invalid api token provided. The value must be a string with length of 32 characters.")
        end
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :dsym_path,
                                       description: "The path to dSYM file located in the user's directory",
                                       optional: false,
                                       type: String),
          FastlaneCore::ConfigItem.new(key: :api_key,
                                       description: "API Key for MTS Metrics'",
                                       optional: false,
                                       type: String,
                                       verify_block: method(:validate_api_key)),
          FastlaneCore::ConfigItem.new(key: :application_id,
                                       description: "Application Identifier",
                                       optional: false,
                                       type: String),
          FastlaneCore::ConfigItem.new(key: :build_number,
                                       description: "Application Build Number",
                                       optional: false,
                                       type: String)
        ]
      end

      def self.is_supported?(platform)
        [:ios].include?(platform)
        true
      end
    end
  end
end
