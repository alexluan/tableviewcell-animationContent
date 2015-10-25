//
//  MainTableViewCell.m
//  scrollview
//
//  Created by 栾有数 on 15/10/23.
//  Copyright © 2015年 栾有数. All rights reserved.
//

#import "MainTableViewCell.h"

@implementation MainTableViewCell
{
    float now;
    int fimt;
}
- (void)awakeFromNib {
    // Initialization code
}
-(void)loadImage{
    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = @(M_PI * 2.0);
    rotationAnimation.duration = 0.9;
    rotationAnimation.autoreverses = NO;
    rotationAnimation.repeatCount = HUGE_VALF;
    rotationAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    [self.imageView.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}
-(void)loadImageMove:(int)time{
    
    now = 23;
    fimt=time;
//    NSTimer * timer = [[NSTimer alloc] initWithFireDate:[NSDate date] interval:0.011 target:self selector:@selector(ttt) userInfo:nil repeats:YES];
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(ttt) userInfo:nil repeats:YES];
   [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    timer = nil;
}
-(void)ttt{
    NSLog(@"%f",self.leadConstraint.constant);
    if (self.leadConstraint.constant >= 200) {
        now = 22;
    }else if(self.leadConstraint.constant <= 20){
        now = 23;
    }
    if (now == 22) {
        self.leadConstraint.constant-=1+fimt;
    }else if(now == 23){
        self.leadConstraint.constant+=1+fimt;
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
