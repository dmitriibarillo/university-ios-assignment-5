#import "InformationVC.h"
#import "AboutVC.h"

@interface InformationVC ()

@property (weak, nonatomic) IBOutlet UILabel *shortInfoLabel;
@property (weak, nonatomic) IBOutlet UIButton *alertButton;
@property (weak, nonatomic) IBOutlet UIButton *informationButton;

@end

@implementation InformationVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initializeComponents];
}

- (void)initializeComponents
{
    
    // initialize shortInfoLabel
    _shortInfoLabel.text = @"Short information about athor";
    _shortInfoLabel.textAlignment = NSTextAlignmentCenter;

    // initialize alertButton
    [self.alertButton setTitle:@"Alert Button" forState:UIControlStateNormal];
    _alertButton.titleLabel.numberOfLines = 0;
    _alertButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    _alertButton.tintColor = [UIColor blackColor];
    
    // initialize informationButton
    [self.informationButton setTitle:@"More info" forState:UIControlStateNormal];
    _informationButton.titleLabel.numberOfLines = 0;
    _informationButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    _informationButton.tintColor = [UIColor blackColor];
}

- (IBAction)alertButtonTaped:(id)sender
{
    NSString *alertText = @"The alert button has been taped.";
    NSString *alertTitle = @"Some Title";
    
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:alertTitle
                          message:alertText
                          delegate:self
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil];
    [alert show];
}

- (IBAction)informationButtonTaped:(id)sender
{
    AboutVC *aboutPage = [[AboutVC alloc] initWithNibName:NSStringFromClass([AboutVC class])
                                                   bundle:[NSBundle mainBundle]];
    [self presentViewController:aboutPage animated:YES completion:nil];
}

@end
