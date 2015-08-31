//
//  UCTransitWidgetsTests.m
//  UCTransitWidgetsTests
//
//  Created by Jerry Wong on 01/22/2015.
//  Copyright (c) 2014 Jerry Wong. All rights reserved.
//

SpecBegin(InitialSpecs)

describe(@"these will pass", ^{
    
    it(@"can do maths", ^{
        expect(1).beLessThan(23);
    });
    
    it(@"can read", ^{
        expect(@"team").toNot.contain(@"I");
    });
});

SpecEnd
