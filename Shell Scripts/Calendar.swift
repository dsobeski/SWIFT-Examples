#!/usr/bin/env DEVELOPER_DIR=/Applications/Xcode6-Beta2.app/Contents/Developer xcrun swift -sdk /Applications/Xcode6-Beta2.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk -i

import Foundation
import EventKit

//
//  We create an object for our Calendar that we will use to add appointments, reminders, etc.
//
class Calendar
{
    //
    //  This is a class function that is called by the main script. We actually create our own
    //  instance of the Calendar object, parse the command line, then add an appointment.
    //
    class func run()
    {
        //
        //  Create a new calendar instance.
        //
        let calendar: Calendar = Calendar()

        //
        //  Set default values for title and location. If the user doesn't set the title and
        //  location on the command line, then we want to have some sort of default.
        //
        var title: String = "Untitled appointment"
        var location: String = "Unknown location"

        //
        //  Loop all the arguments that were passed on the command line. We are not very robust
        //  as this is a simple example. We simply look at the prefix of the string, if it is our
        //  parameter then we fetch the rest of the string. We skip the prefix + the "=" sign and
        //  get the rest of the string.
        //
        for argument in Process.arguments
        {
            if argument.hasPrefix("title")
            {
                title = argument.substringFromIndex(countElements("title") + 1)
            }
            
            if argument.hasPrefix("location")
            {
                location = argument.substringFromIndex(countElements("location") + 1)
            }
        }
        
        //
        //  Add a new appoint to iCal.
        //
        calendar.addAppointment(title, location: location)
    }
    
    //
    //  Using EventKit, we get the event store, create an event object for the default calendar
    //  and then add a title, location, start time and end time (duration). Once done, add it
    //  to iCal and commit the change.
    //
    func addAppointment(title: String, location: String)
    {
        let eventStore: EKEventStore = EKEventStore(accessToEntityTypes: EKEntityMaskEvent)
        let event: EKEvent = EKEvent(eventStore: eventStore)
        
        //
        //  Setup our event based on the current date and time, the passed in location and title.
        //
        event.title = title
        event.location = location
        event.startDate = NSDate()
        event.endDate = NSDate(timeIntervalSinceNow: 600)
        event.calendar = eventStore.defaultCalendarForNewEvents
        
        //
        //  Save the new event and force a commit.
        //
        eventStore.saveEvent(event, span: EKSpanThisEvent, commit: true, error: nil)
    }
}

//
//  Run the Calendar script.Calendar
//
Calendar.run()
