#!/usr/bin/env DEVELOPER_DIR=/Applications/Xcode6-Beta2.app/Contents/Developer xcrun swift -sdk /Applications/Xcode6-Beta2.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk -i

import Foundation

class ExampleClass
{
    func myExampleFunction()
    {
        println("myExampleFunction has been called")
    }
    
    class func myExampleClassFunction()
    {
        println("myExampleClassFunction")
    }
}

println("hello swift")

let fileManager: NSFileManager = NSFileManager.defaultManager()
println("The file manager object: \(fileManager)")

let directoryList: Array = fileManager.contentsOfDirectoryAtPath("/Users", error: nil)
for file: AnyObject in directoryList
{
    println("\(file)")
}

println("----------------------------------")
ExampleClass.myExampleClassFunction()
let e: ExampleClass = ExampleClass()
e.myExampleFunction()

