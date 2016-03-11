#import "UIColor+HexHelper.h"

@implementation UIColor (HexHelper)

- (NSString *)rgbToHex
{
    CGFloat red, green, blue, alpha;
    [self getRed:&red green:&green blue:&blue alpha:&alpha];
    
    NSString *hexColor = [NSString stringWithFormat:@"#%02lX%02lX%02lX",
                          lroundf(red * 255),
                          lroundf(green * 255),
                          lroundf(blue * 255)];
    return hexColor;
}

+ (UIColor *)hexToRBG:(NSString *)hexColor
{
    NSString *colorString = [[hexColor stringByReplacingOccurrencesOfString: @"#" withString: @""] uppercaseString];
    
    unsigned color;
    [[NSScanner scannerWithString:colorString] scanHexInt:&color];
    float red = ((color >> 16) & 0xFF) / 255.0f;
    float green = ((color >> 8) & 0xFF) / 255.0f;
    float blue = ((color >> 0) & 0xFF) / 255.0f;
    
    UIColor *newColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0f];
    return newColor;
}

+ (BOOL)isValidHexColor:(NSString *)hexString
{
    NSString *hexColorRegex = @"#[A-F0-9a-f]{0,7}";
    NSPredicate *hexColorTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", hexColorRegex];
    return [hexColorTest evaluateWithObject:hexString];
}

@end
