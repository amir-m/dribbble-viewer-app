//
//  TableViewController.m
//  Dribbble
//
//  Created by Amir Moravej on 1/23/2014.
//  Copyright (c) 2014 Amir Moravej. All rights reserved.
//

#import "TableViewController.h"
#import "DribbbleShot.h"
#import "WebViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSURL *everyOneShotsURL = [NSURL URLWithString:
        @"http://api.dribbble.com/shots/everyone"];
    
    NSData *everyOneShotsData = [NSData dataWithContentsOfURL:everyOneShotsURL];
    
    NSError *error = nil;
    NSDictionary *everyOneShotsDictionary = [NSJSONSerialization JSONObjectWithData:everyOneShotsData options:0 error:&error];
    
    NSArray *shotsArray = [everyOneShotsDictionary objectForKey:@"shots"];
    
    self.dribbbleShotsArray = [NSMutableArray array];
    
    
    for (NSDictionary *shot in shotsArray) {
        
        DribbbleShot *d = [DribbbleShot dribbbleShotWithTitle:
                           [shot objectForKey:@"title"]];
        
        d.height = (int) [shot objectForKey:@"height"];
        d.width = (int) [shot objectForKey:@"width"];
        d.likes_count = (int) [shot objectForKey:@"likes_count"];
        d.comments_count = (int) [shot objectForKey:@"comments_count"];
        d.views_count = (int) [shot objectForKey:@"views_count"];
        d.url = [NSURL URLWithString:[shot objectForKey:@"url"]];
        d.shotURL = [NSURL URLWithString:[shot objectForKey:@"image_url"]];
        
        [self.dribbbleShotsArray addObject:d];

    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [self.dribbbleShotsArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    DribbbleShot *shot = self.dribbbleShotsArray[indexPath.row];
    
    NSData *imageBuffer = [NSData dataWithContentsOfURL:shot.shotURL];
    
    UIImage *image = [UIImage imageWithData:imageBuffer];
    
    
    
    cell.imageView.image = image;
    cell.textLabel.text = shot.title;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"showDribbbleShot"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];        
        DribbbleShot *shot = self.dribbbleShotsArray[indexPath.row];
        [segue.destinationViewController setShotURL: shot.url];
    }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
