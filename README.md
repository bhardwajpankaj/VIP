# VIP
An Example of Clean Architecture or VIP (Swift)

We are going to discuss Uncle Bob’s Clean architecture here followed by a sample project.
As we have seen MVC architecture turned up into massive view controllers with respect to time to time change request that leads us into difficulties from testing perspective for each module.
I have written this blog to make use of Clean Architecture with a Login screen example which touches all points of this architecture.
In Clean Architecture your project structure is built under Scenes with all files with the help of templates. You can download the templates from here and install in your Xcode. 
Below are the components of this Architecture :
* View
* Router
* Interactor
* Presenter
* Worker
* Models

### Protocols are used here throughout the components to pass data and vice versa.
Protocols are used widely throughout the components to pass & receive data/messages.
## View
Story starts from here with user interactivity, When user interacts then we initiate the request to Interactor.
ViewController which passes all the Request params to Interactor needed for the Worker. 
View controller is also responsible to talk with routing in case of any Navigation needed.

We will create delegates in the view controllers which will pass the View models to us so that we can do relative things
## Router
Router role is here to make navigation between controllers and also passing data if needed. 
As we know the Protocol is the key for any kind of communication so that there are two protocols:
Routing Logic Protocol - Methods needed for routing purpose comes under this protocol.
Data Passing Protocol - This protocols holds the data which will be passed to next view controller.

## Interactor
Interactor is the back-bone here which gets the request initiated by view controllers and then pass the same to worker.
If there is any requirement for validation thing then that should be done here only before go to the worker. Then worker wraps it in a response model to send to the Presenter.
Interactor contains two types of protocol like Router:
Business Logic Protocol - We declare all methods in this protocol which needs to be used for Interactor then they will be available in Viewcontrollers.
Data Store Protocol - This protocol used to pass data between controllers in Routing and Properties needed to hold their current state also declared in this protocol.

## Presenter
Presenter handles the presentation logic of this architecture who is responsible of changing response received from Interactor into ViewModel and pass it to the view controller with the help of its Protocol method.

## Worker
Worker’s responsibility to make API call or Core Data interaction. And it make the data ready for Interactor and handle error and success responses. Via completion handler not Protocol.

## Models
Models contains request, response and view models and store these data for view controller.

