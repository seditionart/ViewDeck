//
//  IIViewDeckApplication.m
//  Sedition Art
//
//  Created by Francis Li on 4/5/13.
//  Copyright (c) 2013 Sedition Limited. All rights reserved.
//

#import "IIViewDeckApplication.h"

#import "IIViewDeckController.h"

@implementation IIViewDeckApplication

- (void)setStatusBarHidden:(BOOL)hidden withAnimation:(UIStatusBarAnimation)animation
{
    NSNotificationCenter *defaultCenter = [NSNotificationCenter defaultCenter];
    NSDictionary *userInfo = @{
                               IIViewDeckApplicatioStatusBarHiddenUserInfoKey: [NSNumber numberWithBool:hidden],
                               IIViewDeckApplicatioStatusBarHiddenAnimationUserInfoKey: [NSNumber numberWithInteger:animation]
                               };
    
    NSNotification *notification = [NSNotification notificationWithName:IIViewDeckApplicationWillChangeStatusBarHiddenNotification
                                                                 object:self
                                                               userInfo:userInfo];
    [defaultCenter postNotification:notification];
    
    [super setStatusBarHidden:hidden withAnimation:animation];
    
    notification = [NSNotification notificationWithName:IIViewDeckApplicationDidChangeStatusBarHiddenNotification
                                                 object:self
                                               userInfo:userInfo];
    [defaultCenter postNotification:notification];
}

@end
