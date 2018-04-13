//
//  MACustomKeyboard.m
//  MACustomKeyboard
//
//  Created by MARWAN on 4/30/16.
//  Copyright © 2016 MARWAN. All rights reserved.
//

#import "MACustomKeyboard.h"

@implementation MACustomKeyboard

- (void)setKeyboardButtons:(NSArray *)keys {
    self.keys = keys;
    for(UIView * view in self.subviews) {
        if([view isKindOfClass:[UIButton class]]) {
            UIButton * keyboardBtn = (UIButton *) view;
            if([keys[keyboardBtn.tag - 1] isKindOfClass:[NSString class]]) {
                [keyboardBtn setTitle:keys[keyboardBtn.tag - 1] forState:UIControlStateNormal];
            }
        }
    }
}

- (IBAction)keyboardButtonPressed:(id)sender {
    UIButton * btn = (UIButton *)sender;
    NSString * text = btn.currentTitle;
    
    if (self.numberTappedBlock != nil) {
        self.numberTappedBlock(self, text);
    }
}

- (IBAction)doneButtonPressed:(id)sender {
    if (self.doneTappedBlock != nil) {
        self.doneTappedBlock(self);
    }
}

- (IBAction)clearButtonPressed:(id)sender {
    if (self.clearTappedBlock != nil) {
        self.clearTappedBlock(self);
    }
}
@end
