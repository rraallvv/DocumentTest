//
//  WindowController.m
//  DocumentTest
//
//  Created by Rhody Lugo on 2/14/15.
//  Copyright (c) 2015 none. All rights reserved.
//

#import "WindowController.h"

static WindowController *sharedInstance = nil;

@interface WindowController ()

@end

@implementation WindowController

- (void)windowDidLoad {
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}

+ (WindowController *) sharedController {
	static dispatch_once_t dispatchOncePredicate = 0;
	dispatch_once(&dispatchOncePredicate, ^{
		sharedInstance = [[NSStoryboard storyboardWithName:@"Main" bundle:nil] instantiateControllerWithIdentifier:@"Document Window Controller"];
	});
	return sharedInstance;
}
/*
+ (id) allocWithZone:(NSZone *)zone {
	//If coder misunderstands this is a singleton, behave properly with
	// ref count +1 on alloc anyway, and still return singleton!
	return [WindowController sharedController];
}*/

- (void)setDocument:(id)document {
	[super setDocument:document];
	if (document != nil && self.contentViewController != nil) {
		self.contentViewController.representedObject = document;
	}
}

@end
