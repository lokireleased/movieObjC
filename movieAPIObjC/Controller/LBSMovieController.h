//
//  LBSMovieController.h
//  movieAPIObjC
//
//  Created by tyson ericksen on 12/6/19.
//  Copyright © 2019 tyson ericksen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LBSMovie.h"
#import <UIKit/UIKit.h>



NS_ASSUME_NONNULL_BEGIN

@interface LBSMovieController : NSObject

+(void)fetchMovieWithSearchTerm: (NSString *)searchTerm completion:(void (^) (NSArray<LBSMovie *> *, NSError *error))completion;

+(void)fetchPosterWithMovie: (LBSMovie *) completion:(void (^)  (UIImage *, NSError *error))completion;

@end

NS_ASSUME_NONNULL_END
