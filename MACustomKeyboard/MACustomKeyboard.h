//
//  MACustomKeyboard.h
//  MACustomKeyboard
//
//  Created by MARWAN on 4/30/16.
//  Copyright © 2016 MARWAN. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MACustomKeyboard;
typedef void (^NumberTappedBlock) (MACustomKeyboard *view, NSString *text);
typedef void (^DoneTappedBlock) (MACustomKeyboard *view);
typedef void (^ClearTappedBlock) (MACustomKeyboard *view);

@interface MACustomKeyboard : UIView

@property (nonatomic,retain) NSArray * keys;
@property (nonatomic, copy) NumberTappedBlock numberTappedBlock;
@property (nonatomic, copy) DoneTappedBlock doneTappedBlock;
@property (nonatomic, copy) ClearTappedBlock clearTappedBlock;

- (void)setKeyboardButtons:(NSArray *)keys;
- (IBAction)keyboardButtonPressed:(id)sender;
@end
