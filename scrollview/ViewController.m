//
//  ViewController.m
//  scrollview
//
//  Created by 栾有数 on 15/10/23.
//  Copyright © 2015年 栾有数. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *mainScrollView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lead;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottom;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *top;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *traing;

@property (weak, nonatomic) IBOutlet UISlider *change;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIImageView *sendImageView;
@end

@implementation ViewController
{
    float firstContraint;
    float lead1;
    float bottom1;
    float top1;
    float traing1;
    
    float flag;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    firstContraint = 250;
    // Do any additional setup after loading the view, typically from a nib.
    
    self.imageView.layer.masksToBounds= YES;
    self.imageView.layer.cornerRadius = 60;
    
    
    self.change.minimumValue = 250;
    self.change.maximumValue = 250+60;
    lead1 = self.lead.constant;
    bottom1 = self.bottom.constant;
    top1 = self.top.constant;
    traing1 = self.traing.constant;
    flag = 0;
}
- (IBAction)sliderChange:(UISlider *)sender {
    self.textField.text =[NSString stringWithFormat:@"%f",sender.value];
    self.heightConstraint.constant = sender.value;
    float now = fabsf(sender.value - firstContraint) ;
    NSLog(@"%f",self.heightConstraint.constant);
    NSLog(@"%f",now);
//    firstContraint = now;
    if (sender.value == 250+60) {
        flag = 22;
    }else if(sender.value == 250){
        flag = 23;
    }
    if (flag == 23) {//变大
        self.lead.constant=lead1-now;
        self.top.constant=top1- now;
        self.traing.constant=traing1- now;
        self.bottom.constant= bottom1- now;
        NSLog(@"变大");
    }else if(flag == 22){//变小
        NSLog(@"变小");
        self.lead.constant=lead1+now;
        self.top.constant=top1+now;
        self.traing.constant=traing1+now;
        self.bottom.constant= bottom1+now;
    }
//    [self.view setNeedsUpdateConstraints];
    [self animationNow];
    
}
-(void)animationNow{
    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = @(M_PI * 2.0);
    rotationAnimation.duration = 0.9;
    rotationAnimation.autoreverses = NO;
    rotationAnimation.repeatCount = HUGE_VALF;
    rotationAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    [self.imageView.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
//    while (YES)
//        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.01]];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
