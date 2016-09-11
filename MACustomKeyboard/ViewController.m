//
//  ViewController.m
//  MACustomKeyboard
//
//  Created by MARWAN on 4/30/16.
//  Copyright © 2016 MARWAN. All rights reserved.
//

#import "ViewController.h"
#import "MACustomKeyboard.h"
@interface ViewController ()
{
    MACustomKeyboard * customKeyboard;
}
@property (weak, nonatomic) IBOutlet UITextField *textField;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    customKeyboard = [[[NSBundle mainBundle] loadNibNamed:@"MACustomKeyboard" owner:self options:nil] firstObject];
    
    [customKeyboard setFrame:CGRectMake(0, 400, self.view.frame.size.width, self.view.frame.size.height - 400)];
    NSArray * keys = @[@"1",@"2",@"3",@"4"
                       ,@"6",@"7",@"8",@"5",@"9",@"0",@"Clear",@"Done"];
    [customKeyboard setKeyboardButtons:keys];
    
    //Keyboaed as inputView
    self.textField.inputView = customKeyboard;
    
    //Blocks
    __weak typeof(self) weakerSelf = self;
    //Number Tapped
    [customKeyboard setNumberTappedBlock:^(MACustomKeyboard *view, NSString *text){
        weakerSelf.textField.text = [weakerSelf.textField.text stringByAppendingString:text];
    }];
    
    //Done button Tapped
    [customKeyboard setDoneTappedBlock:^(MACustomKeyboard *view){
        [weakerSelf.textField resignFirstResponder];
    }];
    //Clear Button Tapped
    [customKeyboard setClearTappedBlock:^(MACustomKeyboard *view){
        if(weakerSelf.textField.text.length > 0){
            weakerSelf.textField.text = [weakerSelf.textField.text substringToIndex:weakerSelf.textField.text.length - 1];
        }
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
