# MACustomKeyboard-iOS
MACustomKeyboard is custom numeric keyboard written in Objective C.
You can dynamically change the order of buttons.
#Screenshots
![alt tag](http://i.imgur.com/gtQPxhz.png)

#How to Use

Check out the sample app for an example of how to use MACustomKeyboard.

MACustomKeyboard is custom UIView which's passed as inputView to any textField



Keys is arary of string values which's shown as keys and applied as text to text field


    NSArray * keys = @[@"1",@"2",@"3",@"4"
                       ,@"6",@"7",@"8",@"5",@"9",@"0",@"Clear",@"Done"];
    [customKeyboard setKeyboardButtons:keys];
    
    __weak typeof(self) weakerSelf = self;
    //Number Tapped
    [customKeyboard setNumberTappedBlock:^(MACustomKeyboard *view, NSString *text) {
        weakerSelf.textField.text = [weakerSelf.textField.text stringByAppendingString:text];
    }];
    
    //Done button Tapped
    [customKeyboard setDoneTappedBlock:^(MACustomKeyboard *view) {
        [weakerSelf.textField resignFirstResponder];
    }];
    //Clear Button Tapped
    [customKeyboard setClearTappedBlock:^(MACustomKeyboard *view) {
        if(weakerSelf.textField.text.length > 0) {
            weakerSelf.textField.text = [weakerSelf.textField.text substringToIndex:weakerSelf.textField.text.length - 1];
        }
    }]


#Author

Marwan Ayman, marwan.ayman8@gmail.com


#License

MACustomKeyboard is available under the MIT license. See the LICENSE file for more info
