#import "BackgroundColorVC.h"
#import "UIColor+HexHelper.h"

@interface BackgroundColorVC () <UITextFieldDelegate>

@property (nonatomic, weak) IBOutlet UITextField *colorField;
@property (nonatomic, weak) IBOutlet UISlider *redSlider;
@property (nonatomic, weak) IBOutlet UISlider *greenSlider;
@property (nonatomic, weak) IBOutlet UISlider *blueSlider;
@property (nonatomic, strong) UIButton *nextNCButton;

@end

@implementation BackgroundColorVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initializeComponents];
    [self updateBackgroundAndSliderColor:[UIColor whiteColor]];
}

- (void)viewWillAppear:(BOOL)animated
{
    NSUInteger numberOfTabBar = self.tabBarController.selectedIndex + 1;
    NSUInteger numberOfNavigationController = [self.navigationController.viewControllers indexOfObject:self];
    self.navigationItem.title = [NSString stringWithFormat:@"BackgroundColorVC %lu(%lu)", (unsigned long)numberOfTabBar,(unsigned long)numberOfNavigationController];
}

- (void)initializeComponents
{
    // Initialize nextBarButton
    NSString *nextBarButtonName = @"Next";
    UIBarButtonItem *nextBarButton = [[UIBarButtonItem alloc]initWithTitle:nextBarButtonName style:UIBarButtonItemStylePlain target:self action:@selector(nextButtonTapped)];
    self.navigationItem.rightBarButtonItem = nextBarButton;
    
    // Add top margin for colorField from TabBar
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.colorField attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.topLayoutGuide attribute:NSLayoutAttributeBottom multiplier:1 constant:20]];
}

- (void)nextButtonTapped
{
    BackgroundColorVC *newBackgroundColorVC = [[BackgroundColorVC alloc] init];
    [self.navigationController pushViewController:newBackgroundColorVC animated:YES];
}

- (IBAction)sliderValueChanged:(id)sender
{
    float red = self.redSlider.value / 255;
    float gree = self.greenSlider.value / 255;
    float blue = self.blueSlider.value / 255;
    [self updateBackgroundColor:[[UIColor alloc] initWithRed:red green:gree blue:blue alpha:1]];
    [self updateColorField:[[UIColor alloc] initWithRed:red green:gree blue:blue alpha:1]];
}

- (void)updateBackgroundColor:(UIColor *)color
{
    self.view.backgroundColor = color;
    CGFloat red, green, blue, alpha;
    [self.view.backgroundColor getRed:&red green:&green blue:&blue alpha:&alpha];
    [self updateSliderWithRed:red green:green blue:blue];
}

- (void)updateBackgroundAndSliderColor:(UIColor *)color
{
    [self updateBackgroundColor:color];

    CGFloat red, green, blue, alpha;
    [self.view.backgroundColor getRed:&red green:&green blue:&blue alpha:&alpha];
    [self updateSliderWithRed:red green:green blue:blue];
    [self updateColorField:color];
}

- (void)updateSliderWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue
{
    self.redSlider.value = red * 255;
    self.greenSlider.value = green * 255;
    self.blueSlider.value = blue * 255;
}

- (void)updateColorField:(UIColor *)color
{
    NSString *hexColor = color.rgbToHex;
    self.colorField.text = hexColor;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSString* resultString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    
    if (resultString.length > 7 ) {
        return NO;
    }
    else if (resultString.length > 1 && resultString.length < 8) {
        if (![[resultString substringWithRange:NSMakeRange(0, 1)] isEqualToString:@"#"]) {
            return NO;
        }
        else if (![UIColor isValidHexColor:resultString]) {
            return NO;
        }
        else {
            UIColor *color = [UIColor hexToRBG:resultString];
            [self updateBackgroundColor:color];
        }
    }
    
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end
