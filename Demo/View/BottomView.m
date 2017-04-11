//
//  BottomView.m
//  Demo
//
//  Created by 荣耀iMac on 17/2/27.
//  Copyright © 2017年 wleleven. All rights reserved.
//

#import "BottomView.h"
#import "CommonFile.h"

@interface BottomView()

@property (nonatomic,assign)BOOL currentState;

@property (weak, nonatomic) IBOutlet UIButton *pullButton;

@end

@implementation BottomView

+ (BottomView *)view
{
    NSArray* nibView =  [[NSBundle mainBundle] loadNibNamed:@"BottomView" owner:nil options:nil];
    return [nibView objectAtIndex:0];
}


- (IBAction)pullButtonClick:(id)sender {
    if (!_currentState) {
        _currentState = YES;
//        [_pullButton setTitle:@"收起" forState:0];
        [_pullButton setImage:[UIImage imageNamed:@"down.png"] forState:0];
        
    }else{
        _currentState = NO;
        [_pullButton setImage:[UIImage imageNamed:@"up.png"] forState:0];
//        [_pullButton setTitle:@"展开" forState:0];

    }
    
    if ([self.delegate respondsToSelector:@selector(bottomView:state:)]) {
        [self.delegate bottomView:self state:_currentState];
    }
}

-(void)setContent:(NSString *)content
{
    _content = content;
    _contentLabel.text = content;
    CGFloat height = [CommonFile heightForString:content fontSize:17 andWidth:997];
    if (height<60) {
        _pullButton.hidden = YES;
    }else{
         _pullButton.hidden = NO;
    }
}


@end
