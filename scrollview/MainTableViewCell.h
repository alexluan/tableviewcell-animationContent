//
//  MainTableViewCell.h
//  scrollview
//
//  Created by 栾有数 on 15/10/23.
//  Copyright © 2015年 栾有数. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leadConstraint;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
-(void)loadImage;
-(void)loadImageMove:(int)time;
@end
