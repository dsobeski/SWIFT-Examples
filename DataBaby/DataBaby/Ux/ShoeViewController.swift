//
//  ShoeViewController.swift
//  DataBaby
//
//  Created by David Sobeski on 6/6/14.
//  Copyright (c) 2014 demo. All rights reserved.
//

import UIKit

class ShoeViewController: UIViewController
{
    // ---------------------------------------------------------------------------------------------
    // MARK: - Constants
    
    // ---------------------------------------------------------------------------------------------
    // MARK: - Properties
    
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
    
    //
    //  The user has finished browsing the catalog, so we need to dismiss ourselves.
    //
    @IBAction func onDone(sender : AnyObject)
    {
        self.dismissModalViewControllerAnimated(true)
    }
}