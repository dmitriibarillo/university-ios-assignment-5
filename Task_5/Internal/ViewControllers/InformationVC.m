#import "InformationVC.h"
#import "AboutVC.h"

@interface InformationVC ()

@property (nonatomic, weak) IBOutlet UILabel *shortInfoLabel;
@property (nonatomic, weak) IBOutlet UIButton *alertButton;
@property (nonatomic, weak) IBOutlet UIButton *informationButton;

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
    self.shortInfoLabel.text = @"Short information about athor";

    // initialize alertButton
    [self.alertButton setTitle:@"Alert Button" forState:UIControlStateNormal];
    
    // initialize informationButton
    [self.informationButton setTitle:@"More info" forState:UIControlStateNormal];
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

- (IBAction)informationButtonTaped
{
    AboutVC *aboutPage = [[AboutVC alloc] init];
    [self presentViewController:aboutPage animated:YES completion:nil];
}

@end
