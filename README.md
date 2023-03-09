# apptest-ios

# Test APP

This is the final result of iterating a base application.
When I started working on the project I decided to focus on the UI and architecture, to achieve scalability and be able to iterate quickly.


## Regarding to the Mandatory Points:

### UI design

This was one of my priorities.
The pulldown to refresh (in home screen) was added to the background view. This is a little bit strange in terms of UX (2 scrolls in the same screen) but its like I undertood the Figma.

### Mock API

I cut off the mockup API, I used npoint instead.
You can modify the JSON response [here](https://www.npoint.io/docs/6bd48f0b414e397bec1d).
###### I leave a file with the JSON in the project root in case you need to recreate it.


### Delay & Persistence

I fake the delay to show how the App works.
I used UserDefaults for persistence. My focus here was creating an isolated module that could be replaced for other implementations like CoreData without changing other layers.


### Home, View More & User Menu

I didn't finish the "User" screen.
I had the intention to add a setting to lock the app and unlock it with biometric data. In fact, that's my recommendation for "Device Binding".
I couldn't finish it without relegating the quality.
However, I'm showing an empty screen because I want to show how the architecture manages the presentation.

### Device Binding

As I mentioned, the best solution is to use biometric authentication.
You can even force the user to set up their biometric verification if they haven't already.


## Architecture

The chosen architecture was MVVM with some modifications.

I introduce the usage of Coordinators to manage the flows or business modules (Home - Products).

Also, I created an AppCoordinator to coordinate the modules coordinators and app events.

 I chose SwiftUI for building the UI but UIKit to build the navigation.
Reasons:
- SwiftUI navigation contains breaking changes in every new SwiffUI version. I think apple is still working to have a solid piece. I prefer UIKit intead because provide us a better more scalable and isolated way to build navigation.
- Non-UI code in SwiftUI screens is dirty code.

#### I left some comments to help understand some technical decisions.
