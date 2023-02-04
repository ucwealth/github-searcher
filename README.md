
[![Swift Version][swift-image]][swift-url]
[![Platform](https://img.shields.io/cocoapods/p/LFAlertController.svg?style=flat)](http://cocoapods.org/pods/LFAlertController)
[![External Library][spm-image]][spm-url]

# github-searcher
<br />
<p align="center">
  <a href="https://github.com/alexanderritik/Best-README-Template">
    <img src="logo.jpeg" alt="Logo" width="80" height="80">
  </a>
  <p align="center">
    This is an app that fetches users from the github api.
    Simply type a name into the search box, and watch github searcher perform it's magic.
  </p>
</p>

## App Architecture and Thought process

#### MVC
The classic Model-View-Controller is the architecture for this app. The app isn't too complex, so there was no need for a more complex architecture

#### Delegates and Protocols
In place of closures and completion handlers, I used delegates and protocols to pass data from the network layer to the UI layer. This made the code cleaner and ensured it was DRY

#### Storyboards and XIB
The views were designed using storyboards and xib files to simplify and make the design process faster

#### SDWebImage
SDWebImage is used for image caching. The images cached from a previous search is cleared from disk and memory when you carry out a search with a different keyword. This is to ensure your disk space doesn't get polluted with stale data

#### XCTest for Unit and UI tests
Thorough Unit and UI tests were written for the app

## Requirements

- iOS 15.0+
- Xcode 13

## Installation

1. Download Xcode and install on your Mac
2. Clone project or download the zip file
3. Double click on downloaded poject's .xcodeproj package to open in xcode
4. Click on the play button at the top left of xcode to run app

## Meta

Thanks for visiting! Please drop star if you like the app

[swift-image]:https://img.shields.io/badge/swift-5.0-orange.svg
[swift-url]: https://swift.org/
[spm-image]: https://img.shields.io/badge/Swift%20Package%20Manager-present-green
[spm-url]: https://github.com/SDWebImage/SDWebImage
