#import "AboutVC.h"

@interface AboutVC ()

@property (nonatomic, weak) IBOutlet UIImageView *imageView;
@property (nonatomic, weak) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UILabel *textLabel;

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
   
    // Initialize textLabel
    self.textLabel.text = @"Steven Paul \"Steve\" Jobs (/ˈdʒɒbz/; February 24, 1955 – October 5, 2011) was an American information technology entrepreneur and inventor. He was the co-founder, chairman, and chief executive officer (CEO) of Apple Inc.; CEO and largest shareholder of Pixar Animation Studios;[3] a member of The Walt Disney Company's board of directors following its acquisition of Pixar; and founder, chairman, and CEO of NeXT Inc. Jobs is widely recognized as a pioneer of the microcomputer revolution of the 1970s, along with Apple co-founder Steve Wozniak. Shortly after his death, Jobs's official biographer, Walter Isaacson, described him as a \"creative entrepreneur whose passion for perfection and ferocious drive revolutionized six industries: personal computers, animated movies, music, phones, tablet computing, and digital publishing.\"";
    self.textLabel.numberOfLines = 0;
}


- (IBAction)closeButtonTaped
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
