# DRImagePlaceholderHelper

With DRImagePlaceholderHelper you can easily create UIImage placeholder like this:

![](Screenshot.png?raw=true)

At first you have to import the Framework
```objective-c
	#import "DRImagePlaceholderHelper.h"
```

To get a placeholder image simply do: (100x100)

```objective-c
	UIImage *placeholderImage = [[DRImagePlaceholderHelper sharedInstance] placerholderImageWithSize:CGSizeMake(100,100)];
```

Or fill a UIImageView 

```objective-c
	[imageView fillWithPlaceholderImage]; 
```

There are also options to customize the fill color & the text inside the image

For more information take a look at the example project.