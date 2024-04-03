describe Fastlane::Actions::UploadDsymToMtsmetricsAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The upload_dsym_to_mtsmetrics plugin is working!")

      Fastlane::Actions::UploadDsymToMtsmetricsAction.run(nil)
    end
  end
end
