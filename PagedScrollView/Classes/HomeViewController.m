//
//  HomeViewController.m
//  PagedScrollView
//


#import "HomeViewController.h"
#import "CycleScrollView.h"

@interface HomeViewController ()

@property (nonatomic , retain) CycleScrollView *mainScorllView;

@end

@implementation HomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSMutableArray *viewsArray = [@[] mutableCopy];
    NSArray *colorArray = @[[UIColor cyanColor],[UIColor blueColor],[UIColor greenColor],[UIColor yellowColor],[UIColor purpleColor]];
    for (int i = 0; i < 2; ++i) {
        UILabel *tempLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 300)];
        tempLabel.backgroundColor = [(UIColor *)[colorArray objectAtIndex:i] colorWithAlphaComponent:0.5];
        [tempLabel setText:[NSString stringWithFormat:@"%d",i]];
        [tempLabel setFont:[UIFont systemFontOfSize:40]];
        
        [viewsArray addObject:tempLabel];
    }
    
    self.mainScorllView = [[CycleScrollView alloc] initWithFrame:CGRectMake(0, 100, 320, 300) animationDuration:2];
    self.mainScorllView.backgroundColor = [[UIColor purpleColor] colorWithAlphaComponent:0.1];
    // 即使是两个数据 也要创建三个对象 ,实现循环的关键是 始终设置contentoffset 为中间的位置，不断更换三个视图的frame
    self.mainScorllView.fetchContentViewAtIndex = ^UIView *(NSInteger pageIndex){
        
        UILabel *tempLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 300)];
        tempLabel.backgroundColor = [(UIColor *)[colorArray objectAtIndex:pageIndex] colorWithAlphaComponent:0.5];
        [tempLabel setText:[NSString stringWithFormat:@"%d",pageIndex]];
        [tempLabel setFont:[UIFont systemFontOfSize:40]];
        return tempLabel;
       
    };
    self.mainScorllView.totalPagesCount = ^NSInteger(void){
        return 2;
    };
    self.mainScorllView.TapActionBlock = ^(NSInteger pageIndex){
        NSLog(@"点击了第%d个",pageIndex);
    };
    [self.view addSubview:self.mainScorllView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
