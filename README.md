# Movie App with OMDb API


This app lists movies using omdb api. Remote config is made with firebase in the application. And push notification settings are made. Firebase Analytics, the details of the movie are analyzed, and the name of the movie is sent to firebase and saved. Lottie was used for animations in the application.

### APP Movie

<a href="https://www.youtube.com/watch?v=KtJJJqXXZr0">
    <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/0/09/YouTube_full-color_icon_%282017%29.svg/2560px-YouTube_full-color_icon_%282017%29.svg.png" width="12%"/>
</a>


### Tools 
- Firebase 
    - Remote Config
    - Analytics
    - Push Notification (Cloud Messaging)
- MVVM
- Network Manager
- Service Manager
- Delegation Pattern
- Closures
- Swift-Storyboard
- UI
  - TableView and Custom Cell
  - ScrollView
  - AnimationView with Lottie

### Packages
- Swift Package Manager
  - [Firebase](https://github.com/firebase/firebase-ios-sdk)
  - [Lottie](https://github.com/airbnb/lottie-ios)
  - [Alamofire](https://github.com/Alamofire/Alamofire.git)
  - [Kingfisher](https://github.com/onevcat/Kingfisher.git)
  - [Reachability.swift](https://github.com/ashleymills/Reachability.swift)

### API
- [OMDb API](http://omdbapi.com/) 

### App Icon

![](images/app/app-icon.png)

### App Launch Screen
![](images/app/launch.png)

### Splash Screen

##### Firebase Push Notification Configure
![](images/splash/push-notification-permission.png)

##### Network Control & Firebase Remote Config Fetch Text

<p align='center'>
<img src="images/splash/splash1.png" width="32.3%"/>
 <img src="images/splash/splash2.png" width="32.3%"/>
<img src="images/splash/splash-not-connected.png" width="32.3%"/>
</p>

![](images/splash/remote-config-firebase.png)

##### Route to Home Screen & Animated Transition .flip
![](images/splash/splash3.png)

### Home Screen
<p align='center'>
    <img src="images/home/home1.png" width="48%"/>
    <img src="images/home/home2.png" width="48%"/>
</p>

##### Search
<p align='center'>
    <img src="images/home/search.png" width="32.3%"/>
    <img src="images/home/search-response.png" width="32.3%"/>
    <img src="images/home/search-not-found.png" width="32.3%"/>
</p>


##### Firebase Analytics & When the movie detail page open

![](images/home/analytics.png)
![](images/home/analytics2.png)
