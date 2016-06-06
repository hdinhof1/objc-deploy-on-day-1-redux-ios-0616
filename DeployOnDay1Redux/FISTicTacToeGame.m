//
//  FISTicTacToeGame.m
//  DeployOnDay1Redux
//
//  Created by Timothy Clem on 9/22/15.
//  Copyright © 2015 The Flatiron School. All rights reserved.
//

#import "FISTicTacToeGame.h"

@interface FISTicTacToeGame ()

@property (nonatomic, strong) NSMutableArray *board;

@end


@implementation FISTicTacToeGame

-(instancetype)init
{
    self = [super init];
    if(self) {
        // Do initialization of your game here, inside this if statement.
        // Leave the rest of this method alone :)
     //   self.board = twoD;
        
       _board = [[NSMutableArray alloc] init];
        NSArray *line1 = @[@"", @"", @""];
        NSArray *line2 = @[@"", @"", @""];
        NSArray *line3 = @[@"", @"", @""];
        
       NSMutableArray *mLine = [line1 mutableCopy];
        NSMutableArray *mLine2 = [line2 mutableCopy];
        NSMutableArray *mLine3 = [line3 mutableCopy];

        [_board addObject:mLine];
        [_board addObject:mLine2];
        [_board addObject:mLine3];
        NSLog(@"%@", _board);
        NSLog(_board[1][1]);

 
/*        _board[2][2] = {
            {@"", @"", @""},
            {@"", @"", @""},
            {@"", @"", @""}
        };
 */
    }

    return self;
}

-(void)resetBoard
{
    for (NSUInteger i = 0; i < 3; i++)
    {
        for (NSUInteger j = 0; j < 3; j++)
        {
            _board[i][j] = @"";
        }
    }
}

-(NSString *)playerAtColumn:(NSUInteger)column row:(NSUInteger)row
{
    
    return _board[column][row];
}

-(BOOL)canPlayAtColumn:(NSUInteger)column row:(NSUInteger)row
{
    BOOL canPlay = YES;
    NSString *space = [self playerAtColumn:column row:row];
    NSUInteger allSpacesArePlayed = 0;
    for (NSUInteger i = 0; i < 3; i++)
    {
        for (NSUInteger j = 0; j < 3; j++)
        {
            if ([_board[i][j] length] == 0)
            {
                allSpacesArePlayed++;
            }
        }
    }
    if ( [space isEqualToString:@"X"] || [space isEqualToString:@"O"] )
        {
            canPlay = NO;
        }


    return canPlay;
}

-(void)playXAtColumn:(NSUInteger)column row:(NSUInteger)row
{
    if ([self canPlayAtColumn:column row:row])
    {
        _board[column][row] = @"X";
    }
}

-(void)playOAtColumn:(NSUInteger)column row:(NSUInteger)row
{
    if ([self canPlayAtColumn:column row:row])
    {
        _board[column][row] = @"O";
    }

}

-(NSString *)winningPlayer
{
    NSString *winner = @"";
    //row 0
    if (       [_board[0][0] isEqualToString: _board[0][1]]  && [_board[0][1] isEqualToString:_board[0][2]] )
    {
        winner = _board[0][0];
    //row 1
    }else if ( [_board[1][0] isEqualToString: _board[1][1]]  && [_board[1][1] isEqualToString:_board[1][2]] )
    {
        winner = _board[1][0];
    //row 2
    }else if ( [_board[2][0] isEqualToString: _board[2][1]]  && [_board[2][1] isEqualToString:_board[2][2]] )
    {
        winner = _board[2][0];
    //column 0
    }else if ( [_board[0][0] isEqualToString: _board[1][0]]  && [_board[1][0] isEqualToString:_board[2][0]] )
    {
        winner = _board[0][0];
    //column 1
    }else if ( [_board[0][1] isEqualToString: _board[1][1]]  && [_board[1][1] isEqualToString:_board[2][1]] )
    {
        winner = _board[0][1];
    //column 2
    }else if ( [_board[0][2] isEqualToString: _board[1][2]]  && [_board[1][2] isEqualToString:_board[2][2]] )
    {
        winner = _board[0][2];
    //diagonal 0 - 9
    }else if ( [_board[0][0] isEqualToString: _board[1][1]]  && [_board[1][1] isEqualToString:_board[2][2]] )
    {
        winner = _board[0][0];
    //diagonal 3 - 7
    }else if ( [_board[0][2] isEqualToString: _board[1][1]]  && [_board[1][1] isEqualToString:_board[2][0]] )
    {
        winner = _board[0][2];
    }

    /*
    //check rows
    for (NSUInteger i = 0; i < 3; i++)
    {
        NSUInteger xScore, oScore = 0;
        for (NSUInteger j = 0; j < 3; j++)
        {
            //if (_board[i][j]
        }
    }
    */
    
   // NSDictionary *domain = (NSDictionary<NSString *,id> *)dictionaryRepresentation;
/*
    if ([winner length] > 0)
    {
        if ( [winner isEqualToString:@"X"] )
        {
            _xPlayerWinCount++;
        }else if ([winner isEqualToString:@"O"] )
        {
            _oPlayerWinCount++;
        }
    }
  */  
    return winner;
}

-(BOOL)isADraw
{
    BOOL isADraw = NO;
    NSUInteger allSpacesArePlayed = 0;
    for (NSUInteger i = 0; i < 3; i++)
    {
        for (NSUInteger j = 0; j < 3; j++)
        {
            if ([_board[i][j] length] == 0)
            {
                allSpacesArePlayed++;
            }
        }
    }
    if (allSpacesArePlayed == 0)
    {
        isADraw = YES;
    }
    return isADraw;
}

@end
