//
//  PSCDropboxFloatingToolbar.m
//  PSPDFCatalog
//
//  Copyright (c) 2013 Peter Steinberger. All rights reserved.
//

#import "PSCDropboxFloatingToolbar.h"

@implementation PSCDropboxFloatingToolbar

///////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - NSObject

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.colors = @[[UIColor colorWithWhite:0.184 alpha:1.000], [UIColor colorWithWhite:0.146 alpha:1.000]];
        _margin = 5;
        self.layer.borderWidth  = 1.f;
        self.layer.cornerRadius = 4.f;
        self.opaque = NO;
    }
    return self;
}

///////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - Public

- (void)setButtons:(NSArray *)buttons {
    if (buttons != _buttons) {
        [_buttons makeObjectsPerformSelector:@selector(removeFromSuperview)]; // remove old buttons.
        _buttons = buttons;
        [self updateButtons];
    }
}

///////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - Private

- (void)updateButtons {
    CGFloat totalWidth = 0;
    for (UIButton *button in self.buttons) {
        [self addSubview:button];
        button.frame = CGRectMake(totalWidth, 0, 44.f, 44.f);
        totalWidth += 44.f + self.margin;
    }

    // Update frame
    CGRect frame = self.frame;
    frame.size.width = totalWidth;
    frame.size.height = 44.f;
    self.frame = frame;
}

@end
