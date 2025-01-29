
/*
  If I have a property x then I need
    a declaration
    zero or one getters.
    zero or more setters.

  property type x;
  get x {code}
  set x(type v) {code}

  type x;
  get property x {}          // there is one getter
  set property x(type v) {}  // there can be many setters.
*/

#import "ViewController.h"

#include "cns.h"
#include "ctest.h"

CG_INLINE CGRect
CGRectSetPos(CGRect frame, CGFloat x, CGFloat y)
{
  CGRect rect;
  rect.origin.x = x; rect.origin.y = y;
  rect.size.width = frame.size.width; rect.size.height = frame.size.height;
  return rect;
}

@interface ViewController ()
{
  int state;
  UIView *inside_view;
  UIButton *example_button;
  UILabel *example_label;
  int show_example_label;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
//  NSLog(@"test1 viewDidLoad");
  cns_log("test2 viewDidLoad");

/*
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = paths[0];

  NSLog(@"documents path %@",path);
*/

  const char *path = cns_documents_path();
  cns_print("Documents path %s", path);
    
  self.view.backgroundColor = UIColor.blueColor;
  show_example_label = true;

  [self test_resource];

}

- (void) test_resource
{
   NSLog(@"test resource");

/*
    char resource_path[512];
    
    const char* utf8String = [[[NSBundle mainBundle] resourcePath] UTF8String];
    snprintf(resource_path, 512, "%s/test2.txt", utf8String);
    
   NSLog(@"%@",[[NSBundle mainBundle] resourcePath]);
*/

  ctest_resource();
  ctest_create_test_document();
}


- (void) viewSafeAreaInsetsDidChange
{
    [super viewSafeAreaInsetsDidChange];
    CGFloat ht=self.view.bounds.size.height;
    CGFloat wd=self.view.bounds.size.width;
    NSLog(@"Screen %f %f",wd,ht);

    CGFloat x0,y0,w0,h0;
    UIEdgeInsets insets = self.view.safeAreaInsets;
    x0=insets.left;
    y0=insets.top;
    w0=wd-(insets.left + insets.right);
    h0=ht-(insets.top + insets.bottom);
    NSLog(@"Insets %f %f %f %f",insets.left,insets.right,insets.top,insets.bottom);
    NSLog(@"Safe %f %f %f %f",x0,y0,w0,h0);

    CGRect newFrame = CGRectMake(x0,y0,w0,h0);
    inside_view = [[UIView alloc] initWithFrame:newFrame];
    inside_view.backgroundColor = UIColor.magentaColor; 
    [[self view] addSubview:inside_view];

// shows how to create the label, set position, size, 
// text color, font, background color,

// How to measure text?
// How to center text in the frame?
// Multiline text?
// Text with markup?

    CGRect labelFrame  = CGRectMake(100,100, 200, 30);
    example_label = [[UILabel alloc] initWithFrame:labelFrame];
    [example_label setText:@"Hello, world"];
    [example_label setBackgroundColor:[UIColor blackColor]];
    [example_label setTextColor:[UIColor whiteColor]];
    [example_label setFont:[UIFont systemFontOfSize:30]];
    [example_label setHidden:false];
// modify the position
    example_label.frame = CGRectSetPos(example_label.frame,50, 300);

    [inside_view addSubview:example_label];

// create a button, set label, position, size (same as label)
    CGRect buttonFrame  = CGRectMake(100,100, 200, 100);

    example_button = [[UIButton alloc] initWithFrame:buttonFrame];
/*
    [example_button setText:@"Push me!"];
    [example_button setBackgroundColor:[UIColor blackColor]];
    [example_button setTextColor:[UIColor whiteColor]];
    [example_button setFont:[UIFont systemFontOfSize:30]];
    [example_button setHidden:false];
*/

    example_button = [[UIButton alloc]initWithFrame:buttonFrame];
    [example_button setTitle:@"Press Me" forState:UIControlStateNormal];
    [example_button addTarget:self action:@selector(buttonEvent:)
         forControlEvents:UIControlEventTouchUpInside];
    [inside_view addSubview:example_button];


}

- (void)buttonEvent:(UIButton *)button {
    NSLog(@"Button Pressed");
    ctest_test_document();

    if (show_example_label)
      {
        [example_label setHidden:true];
        show_example_label = false;
      }
    else
      {
         [example_label setHidden:false];
         show_example_label = true;
      }
    }


- (void)viewWillTransitionToSize:(CGSize)size
         withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
  NSLog(@"config %f %f\n",size.width, size.height);
}

- (void) willenterbackground
{
}

- (void) didenterbackground
{
}

- (void) willenterforeground
{
}

- (void) didenterforeground
{
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end

/*

This is some code that overrides drawTextInRect for a label:

- (void)drawTextInRect:(CGRect)rect {
    if (self.text) {
        CGRect text_rect = 
              [self.text boundingRectWithSize:CGSizeMake(CGRectGetWidth(self.frame), CGFLOAT_MAX)
                         options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                         attributes:@{NSFontAttributeName:self.font}
                         context:nil];
        CGSize labelStringSize = text_rect.size;
        [super drawTextInRect:CGRectMake(0, 0, ceilf(CGRectGetWidth(self.frame)),ceilf(labelStringSize.height))];
    } else {
        [super drawTextInRect:rect];
    }
}

*/
