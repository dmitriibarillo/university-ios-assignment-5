#import "BackgroundColorVC.h"

@interface BackgroundColorVC ()

@property (weak, nonatomic) IBOutlet UITextField *colorField;
@property (weak, nonatomic) IBOutlet UISlider *redSlider;
@property (weak, nonatomic) IBOutlet UISlider *greenSlider;
@property (weak, nonatomic) IBOutlet UISlider *blueSlider;
@property (strong, nonatomic) UIButton *nextNCButton;

@end

@implementation BackgroundColorVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = [NSString stringWithFormat:@"BackgroundColorVC (%d)",[self.navigationController.viewControllers indexOfObject:self]];
    
    [self initializeComponents];
    [self updateBackgroundAndSliderColor:[UIColor greenColor]];
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
    float redColor = _redSlider.value / 255;
    float greeColor = _greenSlider.value / 255;
    float blueColor = _blueSlider.value / 255;
    [self updateBackgroundColor:[[UIColor alloc] initWithRed:redColor green:greeColor blue:blueColor alpha:1]];
    [self updateColorField:[[UIColor alloc] initWithRed:redColor green:greeColor blue:blueColor alpha:1]];
}

- (IBAction)colorFieldChanged:(id)sender
{
    NSString *hexColor = _colorField.text;
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
    _redSlider.value = red * 255;
    _greenSlider.value = green * 255;
    _blueSlider.value = blue * 255;
}

- (void)updateColorField:(UIColor *)color
{
    NSString *hexColor = [self rgbToHex:color];
    _colorField.text = hexColor;
}


- (NSString *)rgbToHex:(UIColor *)color
{
    const CGFloat *components = CGColorGetComponents(color.CGColor);
    float redColor = components[0];
    float greenColor = components[1];
    float blueColor = components[2];
    
    NSString *hexColor = [NSString stringWithFormat:@"#%02lX%02lX%02lX",
                          lroundf(redColor * 255),
                          lroundf(greenColor * 255),
                          lroundf(blueColor * 255)];
    return hexColor;
}

+ (BOOL)validateHexColor:(NSString *)hexString {
    NSString *hexColorRegex = @"#[A-F0-9a-f]{6}";
    NSPredicate *hexColorTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", hexColorRegex];
    return [hexColorTest evaluateWithObject:hexString];
}

@end
