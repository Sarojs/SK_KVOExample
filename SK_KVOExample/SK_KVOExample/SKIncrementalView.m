//
//  SKIncrementalView.m
//  SK_KVOExample
//
//  Created by Saroj Sharma on 28/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SKIncrementalView.h"

#define PI 3.14159265358979323846
static inline float radians(double degrees) { return degrees * PI / 180; }

@implementation SKIncrementalView
@synthesize percent;

- (void)dealloc{
    [percent release];
    [super dealloc];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        percent=[NSNumber numberWithInteger:0];
    }
    return self;
}

- (id) initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super initWithCoder:aDecoder])) {
        [super setBackgroundColor:[UIColor clearColor]];
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

 - (void)drawRect:(CGRect)rect
{
    
    // Get the graphics context and clear it
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextClearRect(ctx, rect);
    
	// define stroke color
//	CGContextSetRGBStrokeColor(ctx, 1, 1, 1, 1.0);
    
	// define line width
	CGContextSetLineWidth(ctx, 4.0);
    float _xCenter=self.center.x-self.frame.origin.x;
    float _yCenter=self.center.y-self.frame.origin.y;
    float _radius= self.frame.size.width>self.frame.size.height?(self.frame.size.height/2):(self.frame.size.width/2);
    
    // system capacity 
	CGContextSetFillColor(ctx, CGColorGetComponents( [[UIColor redColor] CGColor]));
	CGContextMoveToPoint(ctx, _xCenter,_yCenter);     
    CGContextAddArc(ctx, _xCenter, _yCenter, _radius,  radians(0), radians(360), 0); 
    CGContextClosePath(ctx); 
    CGContextFillPath(ctx); 
    
	/* data capacity */
	CGContextSetFillColor(ctx, CGColorGetComponents( [[UIColor greenColor] CGColor]));
	CGContextMoveToPoint(ctx, _xCenter, _yCenter);     
    CGContextAddArc(ctx, _xCenter, _yCenter, _radius,  radians(0), radians([percent integerValue]), 0); 
    CGContextClosePath(ctx); 
    CGContextFillPath(ctx);
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    [self setNeedsDisplay];
}

@end
