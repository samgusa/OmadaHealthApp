# OmadaHealthApp
By Sam Greenhill

This is the Omada take home test. 

## Skills Used: 
* UIKit
* Combine
* Unit Tests
* MVVM design pattern


## Task: 

We would like to display a slideshow of quotes to the user. The quotes that need to be displayed are available in a JSON array. Each element of the array contains the quote, its author, as well as the time that it needs to be displayed.

Build an app using your UI framework of choice and display these quotes. Each quote should be displayed for the specified amount of time, and the screen should then update to show the next quote. You can hardcode the sample data into a data structure of your choice. At the end of the slideshow, loop back to the first slide.

To determine when the quote and author change, I used a Timer.scheduledTimer, and the time interval was the timeDelay.




## Description:

#### Logic

The JSON data is put in a .json file and read using a Bundle decoder shown in the Bundle file. 

I wanted to use Combine to make the tasks more reactive, so I used a Future to read the .json file, as well as other publishers to read to flow of logic.

#### UI

Everything is written programmatically in UIKit. No Storyboards.

I created a custom view for the quote and author name that is in the center of the view. 

The background is using systemBackground, and the text is of color .label, so that it works in light and dark mode.

Because the main focus should be the quote, I determined that they should be bolden, with good distance from the author name.

For a little extra design, an image of the author appears behind the view. To help with seeing the image, the custom view has a little alpha to make it see through, and look more pleasant. 

To make everything look a little better, I add an animation to the change of quote and author. The animation is being used on the alpha, so it looks like the old quote is disappearing and then the new quote is appearing.






