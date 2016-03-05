#import "BackgroundColorVC.h"
#import "UIColor+HexHelper.h"

@interface BackgroundColorVC () <UITextFieldDelegate>

@property (nonatomic, weak) IBOutlet UITextField *colorField;
@property (nonatomic, weak) IBOutlet UISlider *redSlider;
@property (nonatomic, weak) IBOutlet UISlider *greenSlider;
@property (nonatomic, weak) IBOutlet UISlider *blueSlider;
@property (strong, nonatomic) UIButton *nextNCButton;

@end

@implementation BackgroundColorVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initializeComponents];
    [self updateBackgroundAndSliderColor:[UIColor greenColor]];
}

- (void)viewWillAppear:(BOOL)animated
{
    int numberOfTabBar = self.tabBarController.selectedIndex + 1;
    int numberOfNavigationController = [self.navigationController.viewControllers indexOfObject:self];
    self.navigationItem.title = [NSString stringWithFormat:@"BackgroundColorVC %d(%d)", numberOfTabBar, numberOfNavigationController];
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
    [newBackgroundColorVC view];
    [self.navigationController pushViewController:newBackgroundColorVC animated:YES];
}

- (IBAction)sliderValueChanged:(id)sender
{
    float redColor = self.redSlider.value / 255;
    float greeColor = self.greenSlider.value / 255;
    float blueColor = self.blueSlider.value / 255;
    [self updateBackgroundColor:[[UIColor alloc] initWithRed:redColor green:greeColor blue:blueColor alpha:1]];
    [self updateColorField:[[UIColor alloc] initWithRed:redColor green:greeColor blue:blueColor alpha:1]];
}

- (IBAction)colorFieldChanged:(id)sender
{
    NSString *hexColor = self.colorField.text;
    NSString *colorString = [[hexColor stringByReplacingOccurrencesOfString: @"#" withString: @""] uppercaseString];
    
    unsigned color;
    [[NSScanner scannerWithString:colorString] scanHexInt:&color];
    float red = ((color >> 16) & 0xFF) / 255.0f;
    float green = ((color >> 8) & 0xFF) / 255.0f;
    float blue = ((color >> 0) & 0xFF) / 255.0f;

    UIColor *newColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0f];
    
    [self updateBackgroundAndSliderColor:newColor];
}


- (void)updateBackgroundColor:(UIColor *)color
{
    self.view.backgroundColor = color;
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
    
    return YES;
}

@end
