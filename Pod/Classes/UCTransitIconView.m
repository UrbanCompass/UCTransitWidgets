//
//  Created by James Paolantonio on 1/22/15.
//
//

#import "UCTransitIconView.h"

@interface UCTransitIconView ()
@property (nonatomic, copy) UCTransitLine *line;
@end

@implementation UCTransitIconView

- (instancetype)initWithLine:(UCTransitLine *)line {
    self = [super init];
    if (self) {
        self.line = line;
    }
    return self;
}

- (NSString *)description {
    
}

@end
