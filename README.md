# upload_dsym_to_mtsmetrics plugin

[![fastlane Plugin Badge](https://rawcdn.githack.com/fastlane/fastlane/master/fastlane/assets/plugin-badge.svg)](https://rubygems.org/gems/fastlane-plugin-upload_dsym_to_mtsmetrics)

## Getting Started

This project is a [_fastlane_](https://github.com/fastlane/fastlane) plugin. To get started with `fastlane-plugin-upload_dsym_to_mtsmetrics`, add it to your project by running:

```bash
fastlane add_plugin upload_dsym_to_mtsmetrics
```

Specify the source for plugin by setting Git URL
```bash
https://github.com/bogartpi/upload-dsym
```

## Example

Add your new fastlane action to Fastfile:

```bash
platform :ios do
  desc "Upload dSYM to MTS Metrics"
  lane :upload_dsym do
    upload_dsym_to_mtsmetrics(dsym_path: "./YourApplication.app.dSYM.zip", api_key: "XXXXXXXX-XXXXXXXX-XXXXXXXX-XXXXXXXX", applicationId: "test", buildNumber: "test")
  end
end
```

## Issues and Feedback

For any other issues and feedback about this plugin, please submit it to this repository.

## Troubleshooting

If you have trouble using plugins, check out the [Plugins Troubleshooting](https://docs.fastlane.tools/plugins/plugins-troubleshooting/) guide.

## Using _fastlane_ Plugins

For more information about how the `fastlane` plugin system works, check out the [Plugins documentation](https://docs.fastlane.tools/plugins/create-plugin/).

## About _fastlane_

_fastlane_ is the easiest way to automate beta deployments and releases for your iOS and Android apps. To learn more, check out [fastlane.tools](https://fastlane.tools).
