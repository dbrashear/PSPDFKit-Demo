//
//  PSCSectionDescriptor.h
//  PSPDFCatalog
//
//  Copyright (c) 2012-2013 Peter Steinberger. All rights reserved.
//

typedef UIViewController* (^PSControllerBlock)();
@class PSContent;

// Simple model class to describe static section.
@interface PSCSectionDescriptor : NSObject {
    NSMutableArray *_contentDescriptors;
}

- (id)initWithTitle:(NSString *)title footer:(NSString *)footer;
- (void)addContent:(PSContent *)contentDescriptor;

@property (nonatomic, copy) NSArray *contentDescriptors;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *footer;

@end

// Simple model class to describe static content.
@interface PSContent : NSObject

- (id)initWithTitle:(NSString *)title class:(Class)class;
- (id)initWithTitle:(NSString *)title block:(PSControllerBlock)block;

@property (nonatomic, copy)   NSString *title;
@property (nonatomic, strong) Class classToInvoke;
@property (nonatomic, copy)   PSControllerBlock block;

@end
