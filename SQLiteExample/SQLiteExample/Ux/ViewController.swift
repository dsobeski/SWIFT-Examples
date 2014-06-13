//
//  ViewController.swift
//  SQLiteExample
//
//  Created by David Sobeski on 6/12/14.
//  Copyright (c) 2014 demo. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    // ---------------------------------------------------------------------------------------------
    // MARK: - Constants
    
    // ---------------------------------------------------------------------------------------------
    // MARK: - Properties
    
    @IBOutlet var labelWordCount : UILabel
    
    // ---------------------------------------------------------------------------------------------
    // MARK: - UIViewController Method Implementation
    
    //
    //  We are called on this method when we need to initialize the controller. The controller is the
    //  container object of the view (which his done at loadView time) and the model, which we will
    //  initialize here. This is called from the NIB or STORYBOARD. The init method is called when
    //  initializing from code with [[... alloc] init].
    //
    init(coder decoder: NSCoder!)
    {
        //
        //  Call our super to fininalize initialization.
        //
        super.init(coder: decoder)
    }
    
    //
    //  This method is called after the view controller has loaded its view hierarchy into memory.
    //  This method is called regardless of whether the view hierarchy was loaded from a nib file or
    //  created programmatically in the loadView method. You usually override this method to perform
    //  additional initialization on views that were loaded from nib files.
    //
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //
        //  Get the number of words from our model.
        //
        let words: Words = Words()
        let count = words.getCount()
        
        //
        //  Set our count label to the number of words.
        //
        self.labelWordCount.text = "\(count)"
        
        //
        //  Get the list of WordItems from our model.
        //
        let wordItems: WordItem[] = words.getWordItems()
        
        //
        //  Simply print them out to the console in this example.
        //
        for item in wordItems
        {
            println("id: \(item.id) word: \(item.word)")
        }
        
        println("-----------------------------")
        
        //
        //  In this demo, just printing out the list of words instead of the items.
        //
        let wordList = words.getWords()
        for word in wordList
        {
            println("The word is: \(word)")
        }
    }
    
    //
    //  We are notified that view was added to a view hierarchy for this view controller.
    //
    override func viewDidAppear(animated: Bool)
    {
        super.viewDidAppear(animated)
    }
    
    //
    //  This method should free up as much memory as possible by purging cached data objects that can
    //  be recreated (or reloaded from disk) later. Use this method in conjunction with the
    //  didReceiveMemoryWarning of the UIViewController class and the
    //  UIApplicationDidReceiveMemoryWarningNotification notification to release memory throughout
    //  the application.
    //
    //  It is strongly recommended that you implement this method. If your application does not release
    //  enough memory during low-memory conditions, the system may terminate it outright.
    //
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    // ---------------------------------------------------------------------------------------------
    // MARK: - UI Event Actions
    
    // ---------------------------------------------------------------------------------------------
    // MARK: - Internal Helper Methods
}