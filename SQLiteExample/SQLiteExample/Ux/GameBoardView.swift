
import UIKit

@IBDesignable
class GameBoardView : UIView
{
    @IBInspectable var rows:            Int     = 5
    @IBInspectable var columns:         Int     = 5
    @IBInspectable var borderThickness: Int     = 1
    @IBInspectable var boardColor:      UIColor = UIColor.blackColor()
    @IBInspectable var borderColor:     UIColor = UIColor.darkGrayColor()
    @IBInspectable var cellColor:       UIColor = UIColor.whiteColor()
    @IBInspectable var selectedColor:   UIColor = UIColor.blueColor()
    
    init(coder aDecoder: NSCoder!)
    {
        super.init(coder: aDecoder)
        
        self.rows = 5
        self.columns = 5
    }
    
    //
    //  This method is called when a view is first displayed or when an event occurs that
    //  invalidates a visible part of the view. You should never call this method directly 
    //  yourself. To invalidate part of your view, and thus cause that portion to be redrawn, 
    //  call the setNeedsDisplay or setNeedsDisplayInRect: method instead.
    //
    override func drawRect(rect: CGRect)
    {
    }
}