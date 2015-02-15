//
//  ViewController.m
//  DocumentTest
//
//  Created by Rhody Lugo on 2/14/15.
//  Copyright (c) 2015 none. All rights reserved.
//

#import "ViewController.h"
#import "Document.h"

@implementation ViewController

- (void)viewDidLoad {
	
	[super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)setRepresentedObject:(id)representedObject {

	if (self.representedObject)
		[self.representedObject close];

	Document *doc = representedObject;

	if (doc.string)
		self.textView.string = [doc.string copy];
	else
		self.textView.string = @"";

	super.representedObject = representedObject;
}

- (void)textDidChange:(NSNotification *)notification {

	NSTextView *textView = notification.object;

	Document *doc = self.representedObject;

	if (doc && ![doc.string isEqualToString: textView.string])
		doc.string = textView.string;
}

@end
