//
//  ViewController.m
//  SolarSystem
//
//  Created by Tang Hana on 2017/2/13.
//  Copyright © 2017年 Tang Hana. All rights reserved.
//

#import "ViewController.h"
#import "MBProgressHUD.h"
#define PI 3.14159265358979323846

@interface ViewController (){
    MBProgressHUD *HUD;
    UILabel *detail;
    NSTimer *timer;
}


@end

@implementation ViewController

-(void) setPlanet:(CALayer **)planet Speed:(int) speed Radius:(int) radius Color:(UIColor*) color Size:(float) size{
    
    //orbit
    CAShapeLayer* shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2)
                                                     radius:radius
                                                 startAngle:0
                                                   endAngle:2*PI
                                                  clockwise:YES].CGPath;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.strokeColor = [UIColor colorWithRed:169.0f/255.0f green:169.0f/255.0f blue:169.0f/255.0f alpha:0.5].CGColor;
    [self.view.layer addSublayer:shapeLayer];
     [planets addObject:shapeLayer];
    
    //planet
    *planet=[CALayer layer];
    
    (*planet).bounds = CGRectMake(0, 0, 5*size, 5*size);
    
    (*planet).cornerRadius=2.5*size;
    
    (*planet).backgroundColor = color.CGColor;
    
    [self.view.layer addSublayer:(*planet)];
   
    
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    
    //1.路径
    CAKeyframeAnimation *pathAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    pathAnimation.path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2)
                                                        radius:radius
                                                    startAngle:0
                                                      endAngle:2*PI
                                                     clockwise:YES].CGPath;
    animationGroup.animations = @[pathAnimation];
    
    animationGroup.duration = speed;
    
    animationGroup.repeatCount = CGFLOAT_MAX;
    
    animationGroup.removedOnCompletion = NO;
    
    [(*planet) addAnimation:animationGroup forKey:nil];
}

/*//监听应用退到后台
- (void)didEnterBackground
{
    //记录暂停时间
    CFTimeInterval pauseTime =   [self.Earth convertTime:CACurrentMediaTime() fromLayer:nil];
    //设置动画速度为0
    self.Earth.speed = 0;
    //设置动画的偏移时间
    self.Earth.timeOffset = pauseTime;
    
}

///恢复旋转
- (void)didBecomeActive
{
    //暂停的时间
    CFTimeInterval pauseTime = self.Earth.timeOffset;
    //设置动画速度为1
    self.Earth.speed = 1;
    //重置偏移时间
    self.Earth.timeOffset = 0;
    //重置开始时间
    self.Earth.beginTime = 0;
    //计算开始时间
    CFTimeInterval timeSincePause = [self.Earth convertTime:CACurrentMediaTime() fromLayer:nil] - pauseTime;
    //设置开始时间
    self.Earth.beginTime = timeSincePause;
}*/



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    /*
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didEnterBackground) name:UIApplicationDidEnterBackgroundNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didBecomeActive) name:UIApplicationDidBecomeActiveNotification object:nil];*/
    CALayer *Earth;
    CALayer *Venus;
    CALayer *Mars;
    CALayer *Uranus;
    CALayer *Jupiter;
    CALayer *Saturn;
    CALayer *Mercury;
    CALayer *Neptune;
    CALayer *Sun;
    
    planets=[[NSMutableArray alloc] init];
    
    
    self.view.backgroundColor=[UIColor colorWithRed:0.0f/255.0f green:0.0f/255.0f blue:0.0f/255.0f alpha:1.0];
    
    /*Title*/
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0,50, self.view.frame.size.width,100)];
    title.text=@"MY LITTLE SOLAR SYSTEM";
    title.textAlignment=UITextAlignmentCenter;
    title.textColor=[UIColor lightGrayColor];
    title.font =  [UIFont boldSystemFontOfSize:20];
    [self.view addSubview:title];

    /*Mercury*/
    [self setPlanet:&Mercury Speed:2.6 Radius:35 Color:[UIColor colorWithRed:238.0f/255.0f green:219.0f/255.0f blue:198.0f/255.0f alpha:1.0] Size:1];
    
    /*Venus*/
    [self setPlanet:&Venus Speed:4.1 Radius:55 Color:[UIColor colorWithRed:255.0f/255.0f green:186.0f/255.0f blue:64.0f/255.0f alpha:1.0] Size:2];
    
    /*Earth*/
    [self setPlanet:&Earth Speed:5.6 Radius:75 Color:[UIColor colorWithRed:50.0f/255.0f green:188.0f/255.0f blue:240.0f/255.0f alpha:1.0] Size:1.5];
    
    /*Mars*/
    [self setPlanet:&Mars Speed:7.1 Radius:95 Color:[UIColor colorWithRed:249.0f/255.0f green:87.0f/255.0f blue:57.0f/255.0f alpha:1.0] Size:2];
    
    /*Jupiter*/
    [self setPlanet:&Jupiter Speed:8.6 Radius:115 Color:[UIColor colorWithRed:252.0f/255.0f green:147.0f/255.0f blue:75.0f/255.0f alpha:1.0] Size:3.5];
    
    /*Saturn*/
    [self setPlanet:&Saturn Speed:10.1 Radius:135 Color:[UIColor colorWithRed:255.0f/255.0f green:239.0f/255.0f blue:178.0f/255.0f alpha:1.0] Size:3];
    
    /*Uranus*/
    [self setPlanet:&Uranus Speed:11.6 Radius:155 Color:[UIColor colorWithRed:132.0f/255.0f green:205.0f/255.0f blue:200.0f/255.0f alpha:1.0] Size:1.5];
    
    /*Neptune*/
    [self setPlanet:&Neptune Speed:13.1 Radius:175 Color:[UIColor colorWithRed:117.0f/255.0f green:153.0f/255.0f blue:235.0f/255.0f alpha:1.0] Size:1];
    
    /*Sun*/
    Sun=[CALayer layer];
    Sun.bounds = CGRectMake(0,0, 30, 30);
    Sun.cornerRadius=15;
    Sun.position = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
    Sun.backgroundColor = [UIColor colorWithRed:253.0f/255.0f green:239.0f/255.0f blue:137.0f/255.0f alpha:1.0].CGColor;
    [self.view.layer addSublayer:Sun];
    
    /*Note*/
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:@"Mercury● Venus● Earth● Mars●\n Jupiter● Saturn● Uranus● Neptune●"];
    
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:238.0f/255.0f green:219.0f/255.0f blue:198.0f/255.0f alpha:1.0] range:NSMakeRange(0,8)];
    [str addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:7] range:NSMakeRange(0,8)];
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:255.0f/255.0f green:186.0f/255.0f blue:64.0f/255.0f alpha:1.0] range:NSMakeRange(9,6)];
    [str addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:13] range:NSMakeRange(9,6)];
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:50.0f/255.0f green:188.0f/255.0f blue:240.0f/255.0f alpha:1.0] range:NSMakeRange(16,6)];
    [str addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:10] range:NSMakeRange(16,6)];
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:249.0f/255.0f green:87.0f/255.0f blue:57.0f/255.0f alpha:1.0] range:NSMakeRange(23,5)];
    [str addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:13] range:NSMakeRange(23,5)];
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:252.0f/255.0f green:147.0f/255.0f blue:75.0f/255.0f alpha:1.0] range:NSMakeRange(30,8)];
    [str addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:24] range:NSMakeRange(30,8)];
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:255.0f/255.0f green:239.0f/255.0f blue:178.0f/255.0f alpha:1.0] range:NSMakeRange(39,7)];
    [str addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:21] range:NSMakeRange(39,7)];
     [str addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:132.0f/255.0f green:205.0f/255.0f blue:200.0f/255.0f alpha:1.0] range:NSMakeRange(47,7)];
    [str addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:10] range:NSMakeRange(47,7)];
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:117.0f/255.0f green:153.0f/255.0f blue:235.0f/255.0f alpha:1.0] range:NSMakeRange(55,8)];
    [str addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:7] range:NSMakeRange(55,8)];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(butClick:)];
    [self.view addGestureRecognizer:tap];
    
    UILabel *note = [[UILabel alloc] initWithFrame:CGRectMake(0,500, self.view.frame.size.width,200)];
    note.attributedText = str;
    note.textAlignment=UITextAlignmentCenter;
    note.numberOfLines=2;
    [self.view addSubview:note];
    
    /*detail*/
    detail = [[UILabel alloc] initWithFrame:CGRectMake(0,500, self.view.frame.size.width,50)];
    detail.text=@"show detail";
    detail.textAlignment=UITextAlignmentCenter;
    detail.hidden=YES;
    detail.textColor=[UIColor colorWithRed:169.0f/255.0f green:169.0f/255.0f blue:169.0f/255.0f alpha:0.5];
    [self.view addSubview:detail];
}


-(void)butClick:(UITapGestureRecognizer *)gesture{
    CGPoint clickPoint =  [gesture locationInView:self.view];
    for(int i=0;i!=[planets count];i++)
    {
        CAShapeLayer* orbit=[planets objectAtIndex:i];
        if (CGPathContainsPoint(orbit.path,NULL,clickPoint,YES))
        {
           //show description of the selected planet
            NSLog(@"%d",i);
            orbit.strokeColor = [UIColor colorWithRed:169.0f/255.0f green:169.0f/255.0f blue:169.0f/255.0f alpha:1.0].CGColor;
            switch (i) {
                case 0:
                    detail.text=@"Mercury";
                    break;
                case 1:
                    detail.text=@"Venus";
                    break;
                case 2:
                    detail.text=@"Earth";
                    break;
                case 3:
                    detail.text=@"Mars";
                    break;
                case 4:
                    detail.text=@"Jupiter";
                    break;
                case 5:
                    detail.text=@"Saturn";
                    break;
                case 6:
                    detail.text=@"Uranus";
                    break;
                case 7:
                    detail.text=@"Neptune";
                    break;
                default:
                    break;
            }
            detail.hidden=NO;
            [timer invalidate];
            [[UIApplication sharedApplication] beginBackgroundTaskWithExpirationHandler:nil];
            timer=[NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(helper) userInfo:nil repeats:YES];
            [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
            break;
        }
    }
    
}

-(void) helper{
    for(int i=0;i!=[planets count];i++)
    {
        CAShapeLayer* orbit=[planets objectAtIndex:i];
        orbit.strokeColor = [UIColor colorWithRed:169.0f/255.0f green:169.0f/255.0f blue:169.0f/255.0f alpha:0.5].CGColor;
    }
    detail.hidden=YES;
}

/*警告框 提示框 设置*/
- (void)showAlert{
    HUD = [[MBProgressHUD alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2-10,450,10,20)];
    [self.view addSubview:HUD];
    HUD.mode = MBProgressHUDModeText;
    //设置对话框文字
    HUD.label.text =@"ddd";
    [HUD showAnimated:YES];
    [HUD hideAnimated:YES afterDelay:2];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
