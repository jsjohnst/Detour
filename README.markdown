#Hi there!

Introducing Detour, the world's first available web browser for iPad.

Developing an iPad application that uses OAuth is a little difficult right now because MobileSafari may or not be available in the Simulator that may or may not be a part of iPhone SDK 3.2 beta.

#How can Detour help?

When a user needs to authenticate with a service, like Twitter or something, they are taken to the service itself to log in. In a native application, this means opening the system's default browser; if the system doesn't have anything that responds an `http` or `https` URL scheme, nothing happens.

This may or not be the experience a developer will have when writing a native OAuth application for iPad. If they can't authenticate, they're not getting any further than their app's launch screen.

Detour will step in as the default browser, handle the app's request and load the authentication page.

Once the developer has authenticated, the OAuth callback URL is the next destination; provided the developer correctly set that up both in the app bundle's `plist` and the app delegate, their application will come right back up - with the developer authenticated and ready to consume the provider's services!

# Download, Build and Run

* Open a shell and `git clone Detour`.
* `cd Detour`.
* `open Detour.xcodeproj`
* Hit ` ⌘-B` to build the application and run.
* *replace the previous two with `xcodebuild` if you just want to build it.*

*Detour is not intended to be used in a production environment. This application identifies itself to the system as* `com.apple.mobilesafari`*; this is necessary to intercept `http` requests, as it is a reserved URL scheme on this platform. You should remove this application from the Simulator once Apple provides an available browser.*