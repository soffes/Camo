# Camo

[![Version](https://img.shields.io/github/release/soffes/Camo.svg)](https://github.com/soffes/Camo/releases) [![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

Swift client for [Camo](https://github.com/atmos/camo).

Camo depends on [Crypto](https://github.com/soffes/Crypto). Released under the MIT license.



## Installation

[Carthage](https://github.com/carthage/carthage) is the recommended way to install Crypto. Add the following to your Cartfile:

``` ruby
github "soffes/Camo"
```


## Usage

```swift
import Camo

// Setup Camo with your secret and base URL.
// You can also optionally set the HMAC algorithm. The default is SHA1
let camo = Camo(secret: "something-secret", baseURL: NSURL(string: "https://camo.example.com/")!)

// Get a URL to sign
let imageURL = NSURL(string: "http://soffes-assets.s3.amazonaws.com/images/Sam-Soffes.jpg")!

// Get a camo'd URL
camo.sign(URL: URL) // "https://camo.example.com/c426621ed24dd05c47d766e5372de822c5601789?url=http://soffes-assets.s3.amazonaws.com/images/Sam-Soffes.jpg"
```
