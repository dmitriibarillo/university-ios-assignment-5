#import "UIColor+HexHelper.h"

@implementation UIColor (HexHelper)

- (NSString *)rgbToHex
{
    
    const CGFloat *components = CGColorGetComponents(self.CGColor);
    float redColor = components[0];
    float greenColor = components[1];
    float blueColor = components[2];
    
    NSString *hexColor = [NSString stringWithFormat:@"#%02lX%02lX%02lX",
                          lroundf(redColor * 255),
                          lroundf(greenColor * 255),
                          lroundf(blueColor * 255)];
    return hexColor;
}





+ (BOOL)isValidHexColor:(NSString *)hexString {
    NSString *hexColorRegex = @"#[A-F0-9a-f]{6}";
    NSPredicate *hexColorTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", hexColorRegex];
    return [hexColorTest evaluateWithObject:hexString];
}

@end
