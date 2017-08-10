### Shopping Cart

Couple of notes about the app:

* Modularization: I've tried to create a modular architecture for the app following the M-V-VM pattern.
* UI: The UI is very simple I didn't do much styling but the views are well separated from the model and view model objects therefore it would be very easy to impelment a nice UI and add some fancy animations. 
* Storyboard: The app uses storyboards which I'm not a big fan of but in case of a simple app like this it is faster to work with. In a production app I'd prefer separate XIBs for the view controllers and implement the navigation programatically. With that way I can do proper dependency injection to the view controllers, which cannot be done with the segues. 
* Persistence: The app doesn't persist anything, everything stored in memory, but the app designed in a way that it would be easy to add some persistency framework.