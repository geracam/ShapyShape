//
//  IDGAFOSView.m
//  IDGAFOS
//
//  Created by Gerardo Camarena Gomez on 5/17/14.
//  Copyright (c) 2014 Gerardo Camarena Gomez. All rights reserved.
//

#import "IDGAFOSView.h"

@implementation IDGAFOSView

- (id)initWithFrame:(NSRect)frame isPreview:(BOOL)isPreview
{
    self = [super initWithFrame:frame isPreview:isPreview];
    if (self) {
        

        [self setAnimationTimeInterval:1/30.0];
    }
    return self;
}



- (void)startAnimation
{
    [super startAnimation];
}

- (void)stopAnimation
{
    [super stopAnimation];
}

- (void)drawRect:(NSRect)rect
{
    [super drawRect:rect];
}

- (void)animateOneFrame
{
    
    NSBezierPath *path;
    NSRect rect;
    NSSize size;
    NSColor *color;
    float red, green, blue, alpha;
    int shapeType;
    size= [self bounds].size;
    // Calculate random width and height
    rect.size = NSMakeSize( SSRandomFloatBetween( size.width / 100.0,
                                                 size.width / 10.0 ),
                           SSRandomFloatBetween( size.height / 100.0,
                                                size.height / 10.0 ));
    
    rect.origin= SSRandomPointForSizeWithinRect(rect.size, [self bounds]);
    
    shapeType= SSRandomIntBetween(0, 2);
    
    switch (shapeType) {
        case 0:
            path=[NSBezierPath bezierPathWithRect:rect];
            
            break;
            
        case 1:
            
            path=[NSBezierPath bezierPathWithOvalInRect:rect];
            
            break;
            
        case 2:
        default:{
            float startAngle, endAngle, radius;
            NSPoint point;
            
            startAngle= SSRandomFloatBetween(0.0, 360.0);
            endAngle= SSRandomFloatBetween(startAngle, 360.0+startAngle);
            
            radius= rect.size.width <= rect.size.height ?
                rect.size.width / 2: rect.size.height/2;
            
            point= NSMakePoint(rect.origin.x+rect.size.width/ 2, rect.origin.y+rect.size.height/ 2);
            
            path=[NSBezierPath bezierPath];
            
            [path appendBezierPathWithArcWithCenter: point radius:radius startAngle:startAngle endAngle:endAngle clockwise:SSRandomIntBetween(0, 1)];
            
            
                  
            
        }
        break;
            
            
    }
    
    red= SSRandomIntBetween(0.0, 255.0)/ 255.0;
    green = SSRandomFloatBetween( 0.0, 255.0 ) / 255.0;
    blue = SSRandomFloatBetween( 0.0, 255.0 ) / 255.0;
    alpha = SSRandomFloatBetween( 0.0, 255.0 ) / 255.0;
    
    color = [NSColor colorWithCalibratedRed:red
                                      green:green
                                       blue:blue
                                      alpha:alpha];
    
    [color set];
    
    // And finally draw it
    if (SSRandomIntBetween( 0, 1 ) == 0)
        [path fill];
    else
        [path stroke];

    
    
}


- (BOOL)hasConfigureSheet
{
    return NO;
}

- (NSWindow*)configureSheet
{
    return nil;
}

@end
