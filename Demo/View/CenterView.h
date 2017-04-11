//
//  CenterView.h
//  Demo
//
//  Created by 荣耀iMac on 17/2/27.
//  Copyright © 2017年 wleleven. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CenterView;

@protocol CenterViewDelegate <NSObject>

-(void)centerView:(CenterView *)centerView currentIndex:(NSInteger)index preIndex:(NSInteger)preIndex;

@end

@interface CenterView : UIView

+ (CenterView *)view;



@property (nonatomic,assign)NSInteger currentIndex;

@property (nonatomic,strong)NSString *projectName;

@property (nonatomic,strong)NSArray *titleArray;


@property (nonatomic,assign)id<CenterViewDelegate> delegate;

@end
