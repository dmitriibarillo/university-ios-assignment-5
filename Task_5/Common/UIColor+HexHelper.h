#import "UIKit/UIKit.h"

@interface UIColor (HexHelper)

- (NSString *)rgbToHex;

+ (BOOL)isValidHexColor:(NSString *)hexString;

@end
