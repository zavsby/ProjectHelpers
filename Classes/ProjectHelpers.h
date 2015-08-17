//
//  ProjectHelpers.h
//  Helper categories and classes

//  ProjectHelpers
//
//  Created by Sergey P. on 12.07.12.
//  Copyright (c) 2015 Sergey P. All rights reserved.
//

//
// Helper categories
//

#import "MKMapView+ZoomLevel.h"
#import "NSArray+ProjectHelpers.h"
// Method to encode string to Base64 Data and decode Base64 Data to string
#import "NSData-Base64.h"
// Helper methods for working with NSDate
#import "NSDate+PHCalendar.h"
#import "NSDate+ProjectHelpers.h"
#import "NSDictionary+NULLDefender.h"
#import "NSDictionary+ProjectHelpers.h"
// Method +errorWithDomain:description:code creates NSError object with localized error description
#import "NSError+Helper.h"
#import "NSJSONSerialization+ProjectHelpers.h"
#import "NSMutableDictionary+ProjectHelpers.h"
#import "NSSortDescriptor+ProjectHelpers.h"
// Helper methods for working with NSString
// Method for retriving string representation of float time in hours
// Method for encoding string to HTTP string
#import "NSString+ProjectHelpers.h"
#import "ProjectHelpers-Defs.h"
// -documentsDirectory returns path to Application Documents Directory
#import "UIApplication+ProjectHelpers.h"
// Method +colorRGBWithRed:green:blue:alpha creates UIColor with RGB
#import "UIColor+RGB.h"
#import "UIDevice+ProjectHelpers.h"
#import "UIImage+ProjectHelpers.h"
#import "UILabel+ProjectHelpers.h"
// Method -setNavigationBarBackground sets background's image to the navigation bar (for any iOS version)
// Method -screenHeight returns height of iPhone screen
#import "UIScreen+ProjectHelpers.h"
#import "UIScrollView+ProjectHelpers.h"
#import "UISearchBar+BackgroundExtension.h"
// Method -indexPathForRowContainingView: returns NSIndexPath of row in table for any view contained in the cell
#import "UITableView+ProjectHelpers.h"
#import "UIView+ProjectHelpers.h"
#import "UIViewController+ErrorAlert.h"
#import "UIViewController+ProjectHelpers.h"

//
// Helper classes
//

// Class simplify working with NSOperation, you need only to override -main method
// Other work (notifications when executing and finished) is provided by the class
// This class SHOULD be inherited with your own custom operation and method -main SHOULD be overriden
#import "PHOperation.h"

#import "PHTextField.h"
#import "PHTextView.h"
#import "PHAlertView.h"
#import "PHCellSizeManager.h"
#import "PHDateFormatter.h"
#import "PHSegmentsConfiguration.h"