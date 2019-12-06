//
//  LBSMovieController.m
//  movieAPIObjC
//
//  Created by tyson ericksen on 12/6/19.
//  Copyright © 2019 tyson ericksen. All rights reserved.
//

#import "LBSMovieController.h"
#import "LBSMovie.h"


NSString *baseURLAsString = @"https://api.themoviedb.org/3";
NSString *apiKey = @"a41bb0a6d709f7857ffd959b8ab77bfb";
NSString *searchKey = @"search";
NSString *movieKey = @"movie";

@implementation LBSMovieController

+ (void)fetchMovieWithSearchTerm:(NSString *)searchTerm completion:(void (^)(NSArray<LBSMovie *> * _Nonnull, NSError *error))completion
{
    NSURL *baseURL = [[NSURL alloc] initWithString:baseURLAsString];
    NSURL *searchTermURL = [baseURL URLByAppendingPathComponent:searchKey];
    NSURL *movieURL = [searchTermURL URLByAppendingPathComponent:movieKey];
    NSURLComponents *urlComponents = [NSURLComponents componentsWithURL:movieURL resolvingAgainstBaseURL:true];
    NSURLQueryItem *apiQuery = [NSURLQueryItem queryItemWithName:@"api_key" value:apiKey];
    NSURLQueryItem *searchQuery = [NSURLQueryItem queryItemWithName:@"query" value:searchTerm];
    
    urlComponents.queryItems = @[apiQuery, searchQuery];
    NSURL *finalURL = urlComponents.URL;
    NSLog(@"%@", finalURL);
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error)
        {
            NSLog(@"%@", error);
            completion([NSArray new], error);
            return;
        }
        if (response)
        {
            NSLog(@"%@", response);
        }
        if (!data)
        {
            NSLog(@"%@", error);
            completion([NSArray new], error);
            return;
        }
        
        NSMutableArray *movies = [NSMutableArray new];
        NSDictionary *topLevelDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        NSArray *resultsArray = topLevelDictionary[@"results"];
        for (NSDictionary *movieDictionary in resultsArray)
        {
            LBSMovie *newMovie = [[LBSMovie alloc] initWithDictionary:movieDictionary];
            [movies addObject:newMovie];
        }
    }] resume];
}

+ (void)fetchPosterWithMovie:(LBSMovie *)movie completion:(void (^)(UIImage * _Nonnull, NSError * _Nonnull))completion
{
    NSURL *imageURL = [NSURL URLWithString:movie.poster_path];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:imageURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
    
        
    }] resume];
    
}




@end


