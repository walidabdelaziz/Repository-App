# Repositories Fetching - iOS

This is a simple iOS application that allows the user to fetch repositories from an API.

The app is developed using MVVM architecture, RxSwift and URLSession for network requests.

*Requirements
iOS 16.0+
Xcode 14.0+
Swift 5+

*Installation
Clone the repository.
Open PhotosFetchingAndDetails.xcodeproj.
Build and run the project on your simulator or device.

*Features
Fetches repos from an API using URLSession.
Displays repos in a table view using RxSwift.
Add loader while fetching data.

*MVVM Architecture
The app follows MVVM (Model-View-ViewModel) architecture, which separates the responsibilities of the app into three layers:

Model: Contains the data and business logic of the app.
View: Contains the UI elements and user interactions of the app.
ViewModel: Binds the Model and View together and provides the necessary data and actions for the View to render and interact with.
The ViewModel layer is responsible for the business logic of the app, and uses RxSwift to bind the data from the Model layer to the View layer. This way, the ViewModel layer only communicates with the View layer via the data bindings and the View layer never has direct access to the data.

*Network Layer
The app uses URLSession for making network requests to fetch repos from an API. The NetworkManager class handles the network requests, and returns the response in a Result object which can be either a success or failure case.


*Conclusion
This app showcases the use of MVVM architecture, RxSwift and URLSession in a simple repo fetching app.
