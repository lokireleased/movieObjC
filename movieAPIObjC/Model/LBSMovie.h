//
//  LBSMovie.h
//  movieAPIObjC
//
//  Created by tyson ericksen on 12/6/19.
//  Copyright © 2019 tyson ericksen. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LBSMovie : NSObject

@property (nonatomic, readonly, copy) NSString *title;
@property (nonatomic, readonly, copy) NSString *overview;
@property (nonatomic, readonly, copy) NSString *poster_path;
@property (nonatomic, readonly, copy) NSNumber *vote_average;

-(instancetype)initWithMovieTitle: (NSString *)title overview:(NSString *)overview voteAverage:(NSNumber *)vote_average posterPath:(NSString *)poster_path;

-(instancetype)initWithDictionary: (NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
