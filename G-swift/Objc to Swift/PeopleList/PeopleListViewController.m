//
//  PeopleListViewController.m
//  JSONRead
//

#import "PeopleListViewController.h"
#import "PeopleDetailsViewController.h"

@interface PeopleListViewController ()

@property (strong, nonatomic) NSArray *names;
@property (strong, nonatomic) NSArray *data;

@end

@implementation PeopleListViewController

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
	self.title = @"JSONRead";
	
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"contacts" ofType:@"json"];
    NSData *fileData = [NSData dataWithContentsOfFile:filePath];
    NSArray *jsonResult = [NSJSONSerialization JSONObjectWithData:fileData options:kNilOptions error:nil];
	self.data = jsonResult;
	
    NSMutableArray *namesArray = [NSMutableArray array];
    
	for (id item in jsonResult)
    {
        [namesArray addObject:[NSString stringWithFormat:@"%@ %@", item[@"fname"], item[@"lname"]]];
    }
    
	self.names = namesArray;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.names count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    
    cell.textLabel.text = self.names[indexPath.row];
    
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
	PeopleDetailsViewController *detailViewController = [[PeopleDetailsViewController alloc] initWithStyle:UITableViewStyleGrouped];
	detailViewController.details = self.data[indexPath.row];
	[self.navigationController pushViewController:detailViewController animated:YES];
}

@end
