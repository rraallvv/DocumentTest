//
//  Document.m
//  DocumentTest
//
//  Created by Rhody Lugo on 2/14/15.
//  Copyright (c) 2015 none. All rights reserved.
//

#import "Document.h"
#import "WindowController.h"

@interface Document ()

@end

@implementation Document

- (instancetype)init {
    self = [super init];
    if (self) {
		// Add your subclass-specific initialization here.
		_string = @"";
    }
    return self;
}

- (void)windowControllerDidLoadNib:(NSWindowController *)aController {
	[super windowControllerDidLoadNib:aController];
	// Add any code here that needs to be executed once the windowController has loaded the document's window.
}

+ (BOOL)autosavesInPlace {
	return YES;
}

- (void)makeWindowControllers {
	// Override to return the Storyboard file name of the document.
	[self addWindowController:WindowController.sharedController];
}

- (NSData *)dataOfType:(NSString *)typeName error:(NSError **)outError {
	// Insert code here to write your document to data of the specified type. If outError != NULL, ensure that you create and set an appropriate error when returning nil.
	// You can also choose to override -fileWrapperOfType:error:, -writeToURL:ofType:error:, or -writeToURL:ofType:forSaveOperation:originalContentsURL:error: instead.

	return [self.string dataUsingEncoding:NSUTF8StringEncoding];
}

- (BOOL)readFromData:(NSData *)data ofType:(NSString *)typeName error:(NSError **)outError {
	// Insert code here to read your document from the given data of the specified type. If outError != NULL, ensure that you create and set an appropriate error when returning NO.
	// You can also choose to override -readFromFileWrapper:ofType:error: or -readFromURL:ofType:error: instead.
	// If you override either of these, you should also override -isEntireFileLoaded to return NO if the contents are lazily loaded.

	self.string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];

	return YES;
}

- (void)close {
	[self removeWindowController:WindowController.sharedController];
	[super close];
}

@end
