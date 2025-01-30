#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()
{
    ViewController *the_controller;
}

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  NSLog(@"app didFinishLaunching");
  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//  NSLog(@"app window %f %f %f %f",self.window.frame.x,self.window.frame.y,self.window.frame.w,self.window.frame.h);

  [self.window setRootViewController:[[ViewController alloc] init]];
  the_controller = (ViewController *) self.window.rootViewController;
  [self.window makeKeyAndVisible];
  return YES;
}

// This should have been called WillEnterBackground
- (void)applicationWillResignActive:(UIApplication *)application
{
  NSLog(@"app willEnterBackground");
  [the_controller willenterbackground];
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
  NSLog(@"app didEnterBackground");
  [the_controller didenterbackground];
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
  NSLog(@"app willEnterForeground");
  [the_controller willenterforeground];
}

// This should have been called DidEnterForeground
- (void)applicationDidBecomeActive:(UIApplication *)application
{
  NSLog(@"app didEnterForeground");
  [the_controller didenterforeground];
}

@end
