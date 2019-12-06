//
//  LBSMovie.m
//  movieAPIObjC
//
//  Created by tyson ericksen on 12/6/19.
//  Copyright © 2019 tyson ericksen. All rights reserved.
//

#import "LBSMovie.h"

@implementation LBSMovie

- (instancetype)initWithMovieTitle:(NSString *)title overview:(NSString *)overview voteAverage:(NSNumber *)vote_average posterPath:(NSString *)poster_path
{
    self = [super init];
    if (self) {
        _title = [title copy];
        _overview = [overview copy];
        _vote_average = [vote_average copy];
        _poster_path = [poster_path copy];
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSString *title = dictionary[@"title"];
    NSString *overiew = dictionary[@"overview"];
    NSNumber *vote_average = dictionary[@"vote_average"];
    NSString *posterPath = dictionary[@"poster_path"];
    
    return [self initWithMovieTitle:title overview:overiew voteAverage:vote_average posterPath:posterPath];
}

@end
