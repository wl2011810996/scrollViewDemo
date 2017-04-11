//
//  BottomView.h
//  Demo
//
//  Created by 荣耀iMac on 17/2/27.
//  Copyright © 2017年 wleleven. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BottomView;

@protocol BottomViewDelegate <NSObject>

-(void)bottomView:(BottomView *)bottomView state:(BOOL )isPull;

@end


@interface BottomView : UIView

@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

+ (BottomView *)view;

@property (nonatomic,assign)id<BottomViewDelegate> delegate;

@property (nonatomic,strong)NSString *content;


@end
