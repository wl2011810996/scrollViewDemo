//
//  CenterView.m
//  Demo
//
//  Created by 荣耀iMac on 17/2/27.
//  Copyright © 2017年 wleleven. All rights reserved.
//

#import "CenterView.h"

@interface CenterView()
@property (weak, nonatomic) IBOutlet UIImageView *imgv;

@property (weak, nonatomic) IBOutlet UIButton *next;
@property (weak, nonatomic) IBOutlet UIButton *pre;
@property (weak, nonatomic) IBOutlet UILabel *title;

@end

@implementation CenterView

-(void)awakeFromNib
{
    [super awakeFromNib];
    
    
    
    
    UISwipeGestureRecognizer *rightSwipeTap = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeRight:)];
    rightSwipeTap.direction = UISwipeGestureRecognizerDirectionRight;
    [_imgv addGestureRecognizer:rightSwipeTap];
    
    UISwipeGestureRecognizer *leftSwipeTap = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeLeft:)];
    leftSwipeTap.direction = UISwipeGestureRecognizerDirectionLeft;
    [_imgv addGestureRecognizer:leftSwipeTap];
    
    
    
    
    
}

+ (CenterView *)view
{
    NSArray* nibView =  [[NSBundle mainBundle] loadNibNamed:@"CenterView" owner:nil options:nil];
    return [nibView objectAtIndex:0];
}


-(void)swipeLeft:(UISwipeGestureRecognizer *)sender{
    
    if (sender.direction == UISwipeGestureRecognizerDirectionLeft)
    {
        //向左轻扫做的事情
        NSLog(@"bbbb");
        [self nextClick:nil];
     
        
    }
    
}

-(void)swipeRight:(UISwipeGestureRecognizer *)sender{
    NSLog(@"%@",sender);
    UISwipeGestureRecognizer *swipe = sender;
    if (swipe.direction == UISwipeGestureRecognizerDirectionRight)
    {
        //向右轻扫做的事情
        NSLog(@"bbbb");
        [self preClick:nil];
      
    }
}


- (IBAction)preClick:(id)sender {
    NSLog(@"%s",__FUNCTION__);
    if (_currentIndex <=0) {
        _pre.userInteractionEnabled = NO;
        return;
    }
    _next.userInteractionEnabled = YES;
    _currentIndex--;
    _imgv.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.png",_titleArray[_currentIndex]]];

//    _imgv.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld.png",(long)_currentIndex]];
    _title.text = _titleArray[_currentIndex];
    if ([self.delegate respondsToSelector:@selector(centerView:currentIndex:preIndex:)]) {
        [self.delegate centerView:self currentIndex:_currentIndex preIndex:_currentIndex+1];
    }
}


- (IBAction)nextClick:(id)sender {
    NSLog(@"%s",__FUNCTION__);

    if (_currentIndex >= (_titleArray.count-1)) {
        _next.userInteractionEnabled = NO;
        return;
    }
    
    _currentIndex++;
    _pre.userInteractionEnabled =  YES;

//    _imgv.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld.png",(long)_currentIndex]];

    _imgv.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.png",_titleArray[_currentIndex]]];
    _title.text = _titleArray[_currentIndex];
    
    if ([self.delegate respondsToSelector:@selector(centerView:currentIndex:preIndex:)]) {
        [self.delegate centerView:self currentIndex:_currentIndex preIndex:_currentIndex-1];
    }

}

-(void)setProjectName:(NSString *)projectName
{
    _projectName = projectName;
    
    _title.text = _projectName;
}

-(void)setCurrentIndex:(NSInteger)currentIndex
{
    NSLog(@"%s",__FUNCTION__);

    if (currentIndex<=0) {
        _pre.userInteractionEnabled =  NO;
    }else{
         _pre.userInteractionEnabled =  YES;
    }
    
    if (currentIndex>=(_titleArray.count-1)) {
        _next.userInteractionEnabled = NO;
    }else{
        _next.userInteractionEnabled = YES;
    }
    
    _currentIndex = currentIndex;
    
    _title.text = _titleArray[_currentIndex];
   _imgv.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.png",_titleArray[_currentIndex]]];
//    _imgv.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld.png",(long)_currentIndex]];
}

-(void)setTitleArray:(NSArray *)titleArray
{
    _titleArray = titleArray;
}

@end
