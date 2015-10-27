//
//  PeopleDetailsViewController.m
//  JSONRead

#import "PeopleDetailsViewController.h"

@interface PeopleDetailsViewController ()

@end

@implementation PeopleDetailsViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (NSString *)name
{
	return [NSString stringWithFormat:@"%@ %@", self.details[@"fname"], self.details[@"lname"]];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	self.title = [self name];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	
    if (!cell)
    {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
    }
    
    switch (indexPath.row)
    {
		case 0:
        {
			cell.textLabel.text = [self name];
			cell.detailTextLabel.text = @"Name";
			break;
        }
		case 1:
        {
			NSString *email = [self.details objectForKey:@"email"];
            
			if (!email)
            {
				email = @"No email";
            }
            
			if ([email isKindOfClass:[NSArray class]])
            {
				email = @"<Multiple emails>";
            }
            
			cell.textLabel.text = email;
			cell.detailTextLabel.text = @"Email";
            
			break;
		}
		case 2:
        {
			cell.textLabel.text = self.details[@"phone"];
			cell.detailTextLabel.text = @"Phone";
			break;
        }
		default:
        {
			break;
        }
	}
    
    return cell;
}


@end
