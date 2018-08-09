# Writing test code

This plugin makes it very easy to configure your project to use a test file - but you still have to write those tests yourself.

## iOS

When you open up Xcode and open the file `ionic-screen-shots/ui-snapshots.swift` you will see something like this:

```swift
    func testSnapshots() {

        //
        // Place your own tests here. This is a starter example to get you going..
        //
        snapshot("app-launch")

        // XCUIApplication().buttons["Your Button Name"].tap()

        // snapshot("after-button-pressed")

    }
```

In the Xcode UI, select the scheme 'ionic-screen-shots' and click into the method 'testSnapshots()' (after the first snapshot):

<img src="https://cloud.githubusercontent.com/assets/12442390/25378856/2d2d09c8-29a3-11e7-8e1b-e7d4dc3d4543.png" width="490" height="60" alt="Select UI Scheme"/>

You can now click on the 'Record UI Test' (Red Circle Icon):

<img src="https://cloud.githubusercontent.com/assets/12442390/25378879/38282d3a-29a3-11e7-8a5a-50845422f819.png" width="490" height="425" alt="Record UI Test"/>

This will open the simulator and you can click around in your application. XCode will record, each interaction within the `testSnapshots()` method.

When you are done, you can save everything and it will save those interactions into the `fastlane/cordova_screenshots/ios/ui-snapshots.swift`.

You can now add fastlane `snapshot("decription")` where you like.

This whole operation only needs to be done once (or if you want to add more screenshots later).

The UI Test files can be added to your source control and they will be retrofitted into any future generated Ionic projects by the `ionic_ios_snapshot` action.

## Android

TODO