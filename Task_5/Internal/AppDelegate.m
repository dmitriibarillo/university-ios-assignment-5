#import "AppDelegate.h"
#import "BackgroundColorVC.h"
#import "InformationVC.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{

    CGRect mainFrame = [[UIScreen mainScreen] bounds];
    self.window = [[UIWindow alloc] initWithFrame:mainFrame];
    
    BackgroundColorVC *backgroundColorVC1 = [[BackgroundColorVC alloc] init];
    UINavigationController *nc1 = [[UINavigationController alloc] initWithRootViewController:backgroundColorVC1];
    nc1.title = @"NC_1";
    
    BackgroundColorVC *backgroundColorVC2 = [[BackgroundColorVC alloc] init];
    UINavigationController *nc2 = [[UINavigationController alloc] initWithRootViewController:backgroundColorVC2];
    nc2.title = @"NC_2";
    
    InformationVC *informationVC = [[InformationVC alloc] init];
    informationVC.title = @"VC";
    
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Information" bundle:nil];
    UIViewController *navtab = [storyboard instantiateInitialViewController];
    navtab.title = @"SB";
    
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    [tabBarController setViewControllers:@[nc1, nc2, informationVC, navtab]];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    self.window.rootViewController = tabBarController;
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end