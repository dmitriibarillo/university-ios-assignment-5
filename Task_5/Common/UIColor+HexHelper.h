#import "UIKit/UIKit.h"

@interface UIColor (HexHelper)

- (NSString *)rgbToHex;

+ (UIColor *)hexToRBG:(NSString *)hexColor;

+ (BOOL)isValidHexColor:(NSString *)hexString;

@end
