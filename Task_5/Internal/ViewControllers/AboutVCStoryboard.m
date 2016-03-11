#import "AboutVCStoryboard.h"

@interface AboutVCStoryboard ()
@end

@implementation AboutVCStoryboard

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)closeButtonTaped
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
