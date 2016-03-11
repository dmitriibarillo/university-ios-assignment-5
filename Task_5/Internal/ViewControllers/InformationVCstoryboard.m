#import "InformationVCstoryboard.h"

NSString* kThirdStoryboardName = @"InformationVCstoryboard";
NSString* kThirdViewControllerID = @"InformationVCstoryboard";

@interface InformationVCstoryboard ()
@end

@implementation InformationVCstoryboard

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)alertButtonTaped
{
    NSString *alertText = @"The alert button has been taped.";
    NSString *alertTitle = @"Some Title";
    
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:alertTitle
                          message:alertText
                          delegate:nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil];
    [alert show];
}

@end
