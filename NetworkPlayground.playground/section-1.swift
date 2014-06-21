// Playground - noun: a place where people can play

import Foundation
import Cocoa

class Networking
{
    var ipaddressList: AnyObject[]
    {
        get
        {
            return NSHost.currentHost().addresses
        }
    }
    
}

let n: Networking = Networking()
let ipList: Array = n.ipaddressList

for ip: AnyObject in ipList
{
    println("\(ip)")
}
