//
//  BHGeometry.h
//  BHWidgetGallery
//
//  Created by Bryan Hansen on 5/29/13.
//  Copyright (c) 2013 skeuo. All rights reserved.
//

#ifndef BHWidgetGallery_BHGeometry_h
#define BHWidgetGallery_BHGeometry_h

#include <Foundation/Foundation.h>

CG_INLINE CGRect CGRectCenteredInRect(CGRect insideRect, CGRect outsideRect)
{
    CGFloat originX = floorf(outsideRect.origin.x + (outsideRect.size.width - insideRect.size.width) * 0.5f);
    CGFloat originY = floorf(outsideRect.origin.y + (outsideRect.size.height - insideRect.size.height) * 0.5f);
    return CGRectMake(originX, originY, insideRect.size.width, insideRect.size.height);
}

#endif
