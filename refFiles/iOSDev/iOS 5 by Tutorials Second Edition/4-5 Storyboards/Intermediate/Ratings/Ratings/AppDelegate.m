//
//  AppDelegate.m
//  Ratings
//
//  Created by Matthijs Hollemans.
//  Copyright 2011-2012 Razeware LLC. All rights reserved.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//

#import "AppDelegate.h"
#import "Player.h"
#import "PlayersViewController.h"
#import "GesturesViewController.h"

@implementation AppDelegate
{
	NSMutableArray *_players;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	_players = [NSMutableArray arrayWithCapacity:20];

	Player *player = [[Player alloc] init];
	player.name = @"Bill Evans";
	player.game = @"Tic-Tac-Toe";
	player.rating = 4;
	[_players addObject:player];

	player = [[Player alloc] init];
	player.name = @"Oscar Peterson";
	player.game = @"Spin the Bottle";
	player.rating = 5;
	[_players addObject:player];

	player = [[Player alloc] init];
	player.name = @"Dave Brubeck";
	player.game = @"Texas Hold’em Poker";
	player.rating = 2;
	[_players addObject:player];

	UITabBarController *tabBarController;

	if (UI_USER_INTERFACE_IDIOM() != UIUserInterfaceIdiomPad)
	{
		tabBarController = (UITabBarController *)self.window.rootViewController;
	}
	else
	{
		UISplitViewController *splitViewController = (UISplitViewController *)self.window.rootViewController;
		id detailViewController = [splitViewController.viewControllers lastObject];

		UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
		tabBarController = [storyboard instantiateInitialViewController];

		NSArray *viewControllers = @[tabBarController, detailViewController];
		splitViewController.viewControllers = viewControllers;
		splitViewController.delegate = detailViewController;
	}

	UINavigationController *navigationController = [tabBarController viewControllers][0];
	PlayersViewController *playersViewController = [navigationController viewControllers][0];
	playersViewController.players = _players;

	GesturesViewController *gesturesViewController = [tabBarController viewControllers][1];
	gesturesViewController.players = _players;

	tabBarController.contentSizeForViewInPopover = CGSizeMake(320, 460);

    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
	// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
	// Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
	// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
	// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
	// Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
	// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
	// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
