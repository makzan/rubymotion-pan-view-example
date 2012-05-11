class PanDemoViewController < UIViewController
  def loadView
    self.view = UIView.new
  end
  
  def viewDidLoad
    super
    
    # prepare two views for the demo.
    # the screenshot graphics are assets from Path and does not owned by me.
    
    @view1 = UIView.new
    @view1.backgroundColor = UIColor.blackColor
    @view1.addSubview UIImageView.alloc.initWithImage UIImage.imageNamed 'bg.png'
    self.view.addSubview @view1
    
    @view2 = UIView.new
    @view2.backgroundColor = UIColor.whiteColor
    @view2.addSubview UIImageView.alloc.initWithImage UIImage.imageNamed 'fg.png'
    self.view.addSubview @view2
        
    panGesture = UIPanGestureRecognizer.alloc.initWithTarget self, action: "pan:"
    
    self.view.addGestureRecognizer panGesture
    
    
    # animte the view to provide hints on panning action
    UIView.animateWithDuration(0.24, 
      animations: lambda{
        frame = @view2.frame
        frame.origin.x = 13
        @view2.frame = frame  
      }, 
      completion: lambda { |finished|
        UIView.animateWithDuration(0.24, 
          animations: lambda{
            frame = @view2.frame
            frame.origin.x = 0
            @view2.frame = frame  
            })         
      })
        
  end
  
  def pan(recognizer)
    
    translation = recognizer.translationInView self.view
    
    # clone the info of the frame
    frame = @view2.frame
    
    if recognizer.state === UIGestureRecognizerStateEnded
      frame.origin.x = 0
    else
      frame.origin.x += translation.x
    end
    
    # set back the new frame information
    @view2.frame = frame
      
    # reset the translation so we will not have accumulate data next time.
    recognizer.setTranslation CGPointZero, inView: self.view
    
  end
end