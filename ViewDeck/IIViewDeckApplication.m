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
                               IIViewDeskApplicatioStatusBarHiddenUserInfoKey: [NSNumber numberWithBool:hidden],
                               IIViewDeskApplicatioStatusBarHiddenAnimationUserInfoKey: [NSNumber numberWithInteger:animation]
                               };
    
    NSNotification *notification = [NSNotification notificationWithName:IIViewDeskApplicationWillChangeStatusBarHiddenNotification
                                                                 object:self
                                                               userInfo:userInfo];
    [defaultCenter postNotification:notification];
    
    [super setStatusBarHidden:hidden withAnimation:animation];
    
    notification = [NSNotification notificationWithName:IIViewDeskApplicationDidChangeStatusBarHiddenNotification
                                                 object:self
                                               userInfo:userInfo];
    [defaultCenter postNotification:notification];
}

@end
