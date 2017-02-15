//
//  ViewController.m
//  SolarSystem
//
//  Created by Tang Hana on 2017/2/13.
//  Copyright © 2017年 Tang Hana. All rights reserved.
//

#import "ViewController.h"
#define PI 3.14159265358979323846

@interface ViewController ()
@property (nonatomic, strong) CALayer *Earth;
@property (nonatomic, strong) CALayer *Venus;
@property (nonatomic, strong) CALayer *Mars;
@property (nonatomic, strong) CALayer *Uranus;
@property (nonatomic, strong) CALayer *Jupiter;
@property (nonatomic, strong) CALayer *Saturn;
@property (nonatomic, strong) CALayer *Mercury;
@property (nonatomic, strong) CALayer *centerLayer;

@end

@implementation ViewController

-(void) setPlanet:(CALayer *) layer Speed:(int) speed Radius:(int) radius Color:(UIColor*) color Size:(float) size{
    
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
    
    //planet
    layer = [CALayer layer];
    
    layer.bounds = CGRectMake(0, 0, 5*size, 5*size);
    
    layer.cornerRadius=2.5*size;
    
    layer.backgroundColor = color.CGColor;
    
    [self.view.layer addSublayer:layer];
    
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
    
    [layer addAnimation:animationGroup forKey:nil];
    
   

    
}

///监听应用退到后台
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
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    /*
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didEnterBackground) name:UIApplicationDidEnterBackgroundNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didBecomeActive) name:UIApplicationDidBecomeActiveNotification object:nil];*/

    
    /*Mercury*/ //238,219,198
    [self setPlanet:self.Mercury Speed:1 Radius:25 Color:[UIColor colorWithRed:238.0f/255.0f green:219.0f/255.0f blue:198.0f/255.0f alpha:1.0] Size:1];
    
    /*Venus*/ //255,186,64
    [self setPlanet:self.Venus Speed:2 Radius:50 Color:[UIColor colorWithRed:255.0f/255.0f green:186.0f/255.0f blue:64.0f/255.0f alpha:1.0] Size:2];
    
    /*Earth*/ //50,188,240
    [self setPlanet:self.Earth Speed:3 Radius:75 Color:[UIColor colorWithRed:50.0f/255.0f green:188.0f/255.0f blue:240.0f/255.0f alpha:1.0] Size:1.5];
    
    /*Mars*/ //249,87,57
    [self setPlanet:self.Mars Speed:4 Radius:100 Color:[UIColor colorWithRed:249.0f/255.0f green:87.0f/255.0f blue:57.0f/255.0f alpha:1.0] Size:2];
    
    /*Jupiter*/ //252,147,75
    [self setPlanet:self.Jupiter Speed:5 Radius:125 Color:[UIColor colorWithRed:252.0f/255.0f green:147.0f/255.0f blue:75.0f/255.0f alpha:1.0] Size:3.5];
    
    /*Saturn*/ //255,239,178
    [self setPlanet:self.Saturn Speed:6 Radius:150 Color:[UIColor colorWithRed:255.0f/255.0f green:239.0f/255.0f blue:178.0f/255.0f alpha:1.0] Size:3];
    
    /*Uranus*/ //132,205,200
    [self setPlanet:self.Uranus Speed:7 Radius:175 Color:[UIColor colorWithRed:132.0f/255.0f green:205.0f/255.0f blue:200.0f/255.0f alpha:1.0] Size:1.5];
    

    
    /*Sun*/
    
    self.centerLayer = [CALayer layer];
    
    self.centerLayer.bounds = CGRectMake(0,0, 20, 20);
    
    self.centerLayer.cornerRadius=10;
    
    self.centerLayer.position = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
    
    //253,239,137
    self.centerLayer.backgroundColor = [UIColor colorWithRed:253.0f/255.0f green:239.0f/255.0f blue:137.0f/255.0f alpha:1.0].CGColor;
    
    [self.view.layer addSublayer:self.centerLayer];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
