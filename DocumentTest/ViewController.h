//
//  ViewController.h
//  DocumentTest
//
//  Created by Rhody Lugo on 2/14/15.
//  Copyright (c) 2015 none. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController <NSTextViewDelegate>

@property (unsafe_unretained) IBOutlet NSTextView *textView;

@end

