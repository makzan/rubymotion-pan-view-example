class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame UIScreen.mainScreen.bounds
        @window.rootViewController = PanDemoViewController.alloc.init    
        @window.rootViewController.wantsFullScreenLayout = true
        @window.makeKeyAndVisible
  end
end
