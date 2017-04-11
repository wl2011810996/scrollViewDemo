//
//  CommonFile.m
//  Demo
//
//  Created by 荣耀iMac on 17/2/27.
//  Copyright © 2017年 wleleven. All rights reserved.
//

#import "CommonFile.h"
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>



@implementation CommonFile


+ (CGFloat)heightForString:(NSString *)value fontSize:(CGFloat)fontSize andWidth:(CGFloat)width
{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:fontSize], NSParagraphStyleAttributeName:paragraphStyle.copy};
    if ([[[UIDevice currentDevice] systemVersion] floatValue] < 7.0) {
        CGSize expectedLabelSize = [value sizeWithFont:[UIFont systemFontOfSize:fontSize] constrainedToSize:CGSizeMake(width, 1000) lineBreakMode:NSLineBreakByWordWrapping];
        return expectedLabelSize.height;
    } else {
        CGSize expectedLabelSize = [value boundingRectWithSize:CGSizeMake(width, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
        return expectedLabelSize.height;
    }
}


@end
