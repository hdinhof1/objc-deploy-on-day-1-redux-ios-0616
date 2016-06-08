//
//  FISComputerPlayer.m
//  DeployOnDay1Redux
//
//  Created by Timothy Clem on 9/22/15.
//  Copyright © 2015 The Flatiron School. All rights reserved.
//

#import "FISComputerPlayer.h"
#import "FISTicTacToeGame.h"

@implementation FISComputerPlayer

+(BOOL)isEnabled
{
    return YES;
    
}

-(FISTicTacToePosition)nextPlay
{
    NSUInteger row, column;
    row = arc4random() % 3;
    column = arc4random() % 3;
    NSLog(@"row: %lu, column: %lu", (unsigned long)row, column);
    BOOL canPlay = !([self.game canPlayAtColumn:column row:row]);
    NSLog(@"can'tPlayAtColumn: %d", canPlay);

    
    while (!([self.game canPlayAtColumn:column row:row]))
    {
        row = arc4random() % 3;
        column = arc4random() % 3;
    }
    
    return FISTicTacToePositionMake(column, row);
}

@end
