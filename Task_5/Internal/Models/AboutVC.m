#import "AboutVC.h"

@interface AboutVC ()

@property (nonatomic, weak) IBOutlet UIImageView *imageView;
@property (nonatomic, weak) IBOutlet UIScrollView *scrollView;

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
    self.imageView.image = [UIImage imageNamed:@"stevejobs.jpg"];

    CGRect frame = self.scrollView.bounds;
    [self.scrollView setContentSize:frame.size];
    UILabel *textLabel = [[UILabel alloc] initWithFrame:frame];
    textLabel.text = @"Steven Paul \"Steve\" Jobs (/ˈdʒɒbz/; February 24, 1955 – October 5, 2011) was an American information technology entrepreneur and inventor. He was the co-founder, chairman, and chief executive officer (CEO) of Apple Inc.; CEO and largest shareholder of Pixar Animation Studios;[3] a member of The Walt Disney Company's board of directors following its acquisition of Pixar; and founder, chairman, and CEO of NeXT Inc. Jobs is widely recognized as a pioneer of the microcomputer revolution of the 1970s, along with Apple co-founder Steve Wozniak. Shortly after his death, Jobs's official biographer, Walter Isaacson, described him as a \"creative entrepreneur whose passion for perfection and ferocious drive revolutionized six industries: personal computers, animated movies, music, phones, tablet computing, and digital publishing.\"";
    textLabel.numberOfLines = 0;
    textLabel.textColor = [UIColor lightGrayColor];
    textLabel.font = [UIFont systemFontOfSize:16];
    textLabel.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;

    UIView *subView = [[UIView alloc] init];
    CGRect frame2 = CGRectMake(0, 0, frame.size.width, frame.size.height + 100);
    subView.frame = frame2;
    subView.backgroundColor = [UIColor yellowColor];
    
    [self.scrollView addSubview:subView];
    [subView addSubview:textLabel];
    
    // UIView Constraint
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:subView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeTop multiplier:1 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:subView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeBottom multiplier:1 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:subView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeLeading multiplier:1 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:subView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeTrailing multiplier:1 constant:0]];
    
    // UILabel Constraint
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:textLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:subView attribute:NSLayoutAttributeTop multiplier:1 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:textLabel attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:subView attribute:NSLayoutAttributeBottom multiplier:1 constant:0]];
    
    /*
    [subView addConstraint:[NSLayoutConstraint constraintWithItem:textLabel attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:subView attribute:NSLayoutAttributeLeading multiplier:1 constant:0]];
    
    [subView addConstraint:[NSLayoutConstraint constraintWithItem:textLabel attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:subView attribute:NSLayoutAttributeTrailing multiplier:1 constant:0]];
     */
}


- (IBAction)closeButtonTaped
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
