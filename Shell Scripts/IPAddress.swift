#!/usr/bin/env DEVELOPER_DIR=/Applications/Xcode6-Beta2.app/Contents/Developer xcrun swift -F /Applications/Xcode6-Beta2.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk -i

import Foundation

let host: NSHost = NSHost.currentHost()
let addresses: Array = host.addresses as Array

for ipaddress: AnyObject in addresses
{
    if ipaddress as? String
    {
        println("\(ipaddress)")
    }
}