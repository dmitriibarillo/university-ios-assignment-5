#import "AboutVC.h"

@interface AboutVC ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation AboutVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initializeComponents];
}

- (void)initializeComponents
{
    // Initialize imageView
    _imageView.image = [UIImage imageNamed:@"stevejobs.jpg"];
    
    float frameWidth = _scrollView.frame.size.width;
    float frameHeight = _scrollView.frame.size.height;
    CGRect frame = CGRectMake(0, 0, frameWidth, frameHeight);
    
    UITextView *textView = [[UITextView alloc] initWithFrame:frame];
    textView.textAlignment = NSTextAlignmentJustified;
    textView.text = @"Steven Paul \"Steve\" Jobs (/ˈdʒɒbz/; February 24, 1955 – October 5, 2011) was an American information technology entrepreneur and inventor. He was the co-founder, chairman, and chief executive officer (CEO) of Apple Inc.; CEO and largest shareholder of Pixar Animation Studios;[3] a member of The Walt Disney Company's board of directors following its acquisition of Pixar; and founder, chairman, and CEO of NeXT Inc. Jobs is widely recognized as a pioneer of the microcomputer revolution of the 1970s, along with Apple co-founder Steve Wozniak. Shortly after his death, Jobs's official biographer, Walter Isaacson, described him as a \"creative entrepreneur whose passion for perfection and ferocious drive revolutionized six industries: personal computers, animated movies, music, phones, tablet computing, and digital publishing.\"";
    textView.textColor = [UIColor lightGrayColor];
    textView.font = [UIFont systemFontOfSize:16];
    textView.editable = NO;
    textView.scrollEnabled = YES;
    textView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    
    [self.scrollView addSubview:textView];
}


- (IBAction)closeButtonTaped:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
