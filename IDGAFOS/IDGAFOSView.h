//
//  IDGAFOSView.h
//  IDGAFOS/Users/geracam/CPP-Projects/Screensaver/IDGAFOS/IDGAFOS.xcodeproj
//
//  Created by Gerardo Camarena Gomez on 5/17/14.
//  Copyright (c) 2014 Gerardo Camarena Gomez. All rights reserved.
//

#import <ScreenSaver/ScreenSaver.h>

@interface IDGAFOSView : ScreenSaverView

@property (nonatomic, retain) NSOpenGLView* screenSaverView;

-(NSOpenGLView*)createGLView;

@end
