//
//  PHCellSizeManager.m
//  ProjectHelpers
//
//  Created by Sergey P. on 12.07.12.
//  Copyright (c) 2015 Sergey P. All rights reserved.
//

#import "PHCellSizeManager.h"

#define kRZCellSizeManagerCellKey               @"RZCellSizeManagerCellKey"
#define kRZCellSizeManagerObjectClassKey        @"RZCellSizeManagerObjectClassKey"
#define kRZCellSizeManagerConfigurationBlockKey @"RZCellSizeManagerConfigurationBlockKey"

#define kRZCellSizeManagerDefaultCellHeightPadding  1.0f

@interface UIView (AutoLayout)

- (void)moveConstraintsToContentView;

@end


@implementation UIView (AutoLayout)

// Taken from : http://stackoverflow.com/questions/18746929/using-auto-layout-in-uitableview-for-dynamic-cell-layouts-heights
// Note that there may be performance issues with this in some cases.  Should only call in on Awake from nib or initialization and not on reuse.
- (void)moveConstraintsToContentView
{
    if ([self isKindOfClass:[UICollectionViewCell class]] || [self isKindOfClass:[UITableViewCell class]])
    {
        for(NSLayoutConstraint *cellConstraint in self.constraints){
            [self removeConstraint:cellConstraint];
            id firstItem = cellConstraint.firstItem == self ? self.contentView : cellConstraint.firstItem;
            id secondItem = cellConstraint.secondItem == self ? self.contentView : cellConstraint.secondItem;
            //There is a case where we can grab the iOS7 UITableViewCellScrollView which will break, this check is for that.
            if (([[firstItem superview] isEqual:self] && ![firstItem isEqual:self.contentView]) ||
                ([[secondItem superview] isEqual:self] && ![secondItem isEqual:self.contentView]))
            {
                continue;
            }
            
            NSLayoutConstraint* contentViewConstraint =
            [NSLayoutConstraint constraintWithItem:firstItem
                                         attribute:cellConstraint.firstAttribute
                                         relatedBy:cellConstraint.relation
                                            toItem:secondItem
                                         attribute:cellConstraint.secondAttribute
                                        multiplier:cellConstraint.multiplier
                                          constant:cellConstraint.constant];
            [self.contentView addConstraint:contentViewConstraint];
        }
    }
}

- (UIView *)contentView
{
    // We know we are a collectionview cell or a tableview cell so this is safe.
    return [(UITableViewCell *)self contentView];
}

@end


/**
 *  RZCellSizeManagerCellConfiguration
 **/
@interface RZCellSizeManagerCellConfiguration : NSObject
@property (nonatomic, strong) id cell;
@property (nonatomic, copy) RZCellSizeManagerConfigBlock configurationBlock;
@property (nonatomic, copy) RZCellSizeManagerHeightBlock heightBlock;
@property (nonatomic, copy) RZCellSizeManagerSizeBlock sizeBlock;
@property (nonatomic, assign) Class objectClass;
@property (nonatomic, strong) NSString* cellClass;
@property (nonatomic, strong) NSString* reuseIdentifier;

+ (instancetype) cellConfigurationWithCell:(id)cell
                                 cellClass:(NSString *)cellClass
                               objectClass:(Class)objectClass
                        configurationBlock:(RZCellSizeManagerConfigBlock)configurationBlock;
+ (instancetype) cellConfigurationWithCell:(id)cell
                                 cellClass:(NSString *)cellClass
                               objectClass:(Class)objectClass
                               heightBlock:(RZCellSizeManagerHeightBlock)heightBlock;
+ (instancetype) cellConfigurationWithCell:(id)cell
                                 cellClass:(NSString *)cellClass
                               objectClass:(Class)objectClass
                                 sizeBlock:(RZCellSizeManagerSizeBlock)sizeBlock;
@end

@implementation RZCellSizeManagerCellConfiguration

+ (instancetype) cellConfigurationWithCell:(id)cell
                                 cellClass:(NSString *)cellClass
                               objectClass:(Class)objectClass
                        configurationBlock:(RZCellSizeManagerConfigBlock)configurationBlock
{
    RZCellSizeManagerCellConfiguration* config = [RZCellSizeManagerCellConfiguration new];
    config.cell = cell;
    config.cellClass = cellClass;
    config.objectClass = objectClass;
    config.configurationBlock = configurationBlock;
    return config;
}

+ (instancetype) cellConfigurationWithCell:(id)cell
                                 cellClass:(NSString *)cellClass
                               objectClass:(Class)objectClass
                               heightBlock:(RZCellSizeManagerHeightBlock)heightBlock;
{
    RZCellSizeManagerCellConfiguration* config = [RZCellSizeManagerCellConfiguration new];
    config.cell = cell;
    config.cellClass = cellClass;
    config.objectClass = objectClass;
    config.heightBlock = heightBlock;
    return config;
}

+ (instancetype) cellConfigurationWithCell:(id)cell
                                 cellClass:(NSString *)cellClass
                               objectClass:(Class)objectClass
                                 sizeBlock:(RZCellSizeManagerSizeBlock)sizeBlock
{
    RZCellSizeManagerCellConfiguration* config = [RZCellSizeManagerCellConfiguration new];
    config.cell = cell;
    config.cellClass = cellClass;
    config.objectClass = objectClass;
    config.sizeBlock = sizeBlock;
    return config;
}

@end


/**
 * RZCellHeightManager
 **/

@interface PHCellSizeManager ()

@property (nonatomic, strong) NSMutableDictionary* cellConfigurations;
@property (nonatomic, strong) id offScreenCell;
@property (nonatomic, strong) NSString* cellClassName;
@property (nonatomic, strong) NSString* cellNibName;
@property (nonatomic, strong) NSCache* cellSizeCache;


@property (nonatomic, assign) BOOL isUsingObjectTypesForLookup;

@property (nonatomic, copy) RZCellSizeManagerConfigBlock configurationBlock;
@property (nonatomic, copy) RZCellSizeManagerHeightBlock heightBlock;
@property (nonatomic, copy) RZCellSizeManagerSizeBlock sizeBlock;

@end

@implementation PHCellSizeManager

#pragma mark - Initializers

/**
 * A common init function
 * Initializes the cellConfigurations dictionary and the cellSizeCache.
 **/
- (instancetype)init
{
    self = [super init];
    if ( self ) {
        _cellConfigurations = [NSMutableDictionary dictionary];
        _cellSizeCache = [[NSCache alloc] init];
        _cellHeightPadding = kRZCellSizeManagerDefaultCellHeightPadding;
    }
    return self;
}

#pragma mark - Custom Setters

- (void)setOverideWidth:(CGFloat)overideWidth
{
    if (overideWidth != _overideWidth)
    {
        _overideWidth = overideWidth;
        [self.cellConfigurations enumerateKeysAndObjectsUsingBlock:^(id key, RZCellSizeManagerCellConfiguration *obj, BOOL *stop) {
            id cell = obj.cell;
            CGRect overideFrame = [cell frame];
            overideFrame.size.width = overideWidth;
            [cell setFrame:overideFrame];
            [cell setNeedsLayout];
            [cell layoutIfNeeded];
        }];
        [self invalidateCellSizeCache];
    }
}

#pragma mark - Registration methods

- (void)registerCellClassName:(NSString *)cellClass
                 withNibNamed:(NSString *)nibNameOrNil
           forReuseIdentifier:(NSString *)reuseIdentifier
       withConfigurationBlock:(RZCellSizeManagerConfigBlock)configurationBlock
{
    NSParameterAssert(cellClass);
    NSParameterAssert(configurationBlock);
    NSParameterAssert(reuseIdentifier);
    
    id cell = [self configureOffScreenCellWithCellReuseIdentifier:reuseIdentifier nibName:nibNameOrNil];
    
    RZCellSizeManagerCellConfiguration* configuration = [RZCellSizeManagerCellConfiguration cellConfigurationWithCell:cell
                                                                                                            cellClass:cellClass
                                                                                                          objectClass:nil
                                                                                                   configurationBlock:configurationBlock];
    configuration.reuseIdentifier = reuseIdentifier;
    [self.cellConfigurations setObject:configuration forKey:reuseIdentifier];
}

- (void)registerCellClassName:(NSString *)cellClass
                 withNibNamed:(NSString *)nibNameOrNil
           forReuseIdentifier:(NSString *)reuseIdentifier
              withHeightBlock:(RZCellSizeManagerHeightBlock)heightBlock
{
    NSParameterAssert(cellClass);
    NSParameterAssert(heightBlock);
    NSParameterAssert(reuseIdentifier);
    
    id cell = [self configureOffScreenCellWithCellReuseIdentifier:reuseIdentifier nibName:nibNameOrNil];
    RZCellSizeManagerCellConfiguration* configuration = [RZCellSizeManagerCellConfiguration cellConfigurationWithCell:cell
                                                                                                            cellClass:cellClass
                                                                                                          objectClass:nil
                                                                                                            heightBlock:heightBlock];
    configuration.reuseIdentifier = reuseIdentifier;
    [self.cellConfigurations setObject:configuration forKey:reuseIdentifier];
}

- (void)registerCellClassName:(NSString *)cellClass
                 withNibNamed:(NSString *)nibNameOrNil
           forReuseIdentifier:(NSString *)reuseIdentifier
                withSizeBlock:(RZCellSizeManagerSizeBlock)sizeBlock
{
    NSParameterAssert(cellClass);
    NSParameterAssert(sizeBlock);
    NSParameterAssert(reuseIdentifier);
    
    id cell = [self configureOffScreenCellWithCellReuseIdentifier:reuseIdentifier nibName:nibNameOrNil];
    RZCellSizeManagerCellConfiguration* configuration = [RZCellSizeManagerCellConfiguration cellConfigurationWithCell:cell
                                                                                                            cellClass:cellClass
                                                                                                          objectClass:nil
                                                                                                            sizeBlock:sizeBlock];
    configuration.reuseIdentifier = reuseIdentifier;
    [self.cellConfigurations setObject:configuration forKey:reuseIdentifier];
}

#pragma mark - Other Public Methods

- (void)invalidateCellSizeCache
{
    [self.cellSizeCache removeAllObjects];
}

- (void)invalidateCellSizeAtIndexPath:(NSIndexPath *)indexPath
{
    NSParameterAssert(indexPath);
    [self.cellSizeCache removeObjectForKey:indexPath];
}

- (void)invalidateCellSizesAtIndexPaths:(NSArray *)indexPaths
{
    NSParameterAssert(indexPaths);
    [indexPaths enumerateObjectsUsingBlock:^(NSIndexPath* obj, NSUInteger idx, BOOL *stop) {
        [self.cellSizeCache removeObjectForKey:obj];
    }];
}

- (CGFloat)cellHeightForObject:(id)object indexPath:(NSIndexPath *)indexPath cellReuseIdentifier:(NSString *)reuseIdentifier
{
    NSParameterAssert(indexPath);

    NSNumber * height = [self.cellSizeCache objectForKey:indexPath];
    if (height == nil)
    {
        RZCellSizeManagerCellConfiguration* configuration = [self configurationForObject:object reuseIdentifier:reuseIdentifier];
        
        height = [self cellHeightForObject:object configuration:configuration];
        
        if (height)
        {
            [self.cellSizeCache setObject:height forKey:indexPath];
        }
    }
    return [height floatValue];
}


- (CGSize)cellSizeForObject:(id)object indexPath:(NSIndexPath *)indexPath cellReuseIdentifier:(NSString *)reuseIdentifier
{
    NSParameterAssert(indexPath);
    
    id obj = [self.cellSizeCache objectForKey:indexPath];
    CGSize size = CGSizeZero;
    if (obj == nil)
    {
        RZCellSizeManagerCellConfiguration* configuration = [self configurationForObject:object reuseIdentifier:reuseIdentifier];
        
        BOOL validSize = NO;
        if (configuration)
        {
            if (configuration.configurationBlock)
            {
                [configuration.cell prepareForReuse];
                configuration.configurationBlock(configuration.cell, object);
                UIView* contentView = [configuration.cell contentView];
                size = [contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
                validSize = YES;
                
            }
            else if (configuration.sizeBlock)
            {
                size = configuration.sizeBlock(configuration.cell, object);
                validSize = YES;
                
            }
            
        }
        

        if (validSize)
        {
            [self.cellSizeCache setObject:[NSValue valueWithCGSize:size] forKey:indexPath];
        }
        
    }
    else
    {
        // Hopefully we have an NSValue object that has a CGSize value
        if ([obj isKindOfClass:[NSValue class]])
        {
            size = [obj CGSizeValue];
        }
    }
    return size;
}

#pragma mark - Private Methods

/**
 * Creates a cell to be stored offscreen to use for AutoLayout.
 * The cell is initially created from a nib that shares the same name as the class passed in.
 *  It will then just allocate an instance using the default init.
 **/
- (id)configureOffScreenCellWithCellReuseIdentifier:(NSString *)reuseIdentifier nibName:(NSString *)nibNameOrNil
{
    if ([self.cellConfigurations objectForKey:reuseIdentifier])
    {
        [self.cellConfigurations removeObjectForKey:reuseIdentifier];
    }
    
    //Configure the static cell
    id cell = nil;
    if (reuseIdentifier)
    {
        NSString *nibName = nibNameOrNil != nil ? nibNameOrNil : reuseIdentifier;
        BOOL nibExists = ([[NSBundle mainBundle] pathForResource:nibName ofType:@"nib"] != nil);
        UINib *nib = [UINib nibWithNibName:nibName bundle:nil];
        
        // Try and instantiate the cell from the nib.  If not we shall just call init on it.
        if (nibExists)
        {
            cell = [[nib instantiateWithOwner:nil options:nil] objectAtIndex:0];
        }
        else
        {
            // There is a chance that we want to just create it with init.
            cell = [[NSClassFromString(reuseIdentifier) alloc] init];
        }

        [cell moveConstraintsToContentView];
    }
    
    
    if (self.overideWidth != 0)
    {
        CGRect overideFrame = [cell frame];
        overideFrame.size.width = self.overideWidth;
        [cell setFrame:overideFrame];
        [cell setNeedsLayout];
        [cell layoutIfNeeded];
    }
    
    NSAssert(cell != nil, @"Cell not created successfully.  Make sure there is a cell with your class name in your project:%@", reuseIdentifier);
    return cell;
}

/** 
 * returns the configuration object that is associated with either the object or the reuseIdentifier
 * This will first check to see if we are sending in a reuseIdentifier.  If we do, it will not try and
 *  object match, otherwise it will see if we have an object class regiserted to match the object.
 **/
- (RZCellSizeManagerCellConfiguration *)configurationForObject:(id)object reuseIdentifier:(NSString *)reuseIdentifier
{
    NSParameterAssert(reuseIdentifier);
    
    RZCellSizeManagerCellConfiguration* configuration = [self.cellConfigurations objectForKey:reuseIdentifier];
    if (!configuration)
    {
        configuration = [[self.cellConfigurations allValues] firstObject];
    }
    
    return configuration;
}

- (NSNumber *)cellHeightForObject:(id)object configuration:(RZCellSizeManagerCellConfiguration *)configuration
{
    NSNumber* height = nil;
    if (configuration)
    {
        if (configuration.configurationBlock)
        {
            [configuration.cell prepareForReuse];
            configuration.configurationBlock(configuration.cell, object);
            [configuration.cell layoutIfNeeded];
            UIView* contentView = [configuration.cell contentView];
            height = @([contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height + self.cellHeightPadding);
        }
        else if (configuration.heightBlock)
        {
            height = @(configuration.heightBlock(configuration.cell, object) + self.cellHeightPadding);
        }
        
    }
    return height;

}

@end


