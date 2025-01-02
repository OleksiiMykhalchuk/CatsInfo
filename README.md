# Cat Breeds Viewer
This repository contains a simple iOS application task built using SwiftUI that showcases a list of cat breeds with photos in a grid layout. Upon selection of a breed, detailed information about that breed is displayed.

## Table of Contents
- [Project Overview](#project-overview)
- [Features](#features)
- [Architecture](#architecture)
- [Technologies Used](#technologies-used)
- [Installation](#installation)
- [Screenshots](#screenshots)
- [Time Spent](#time-spent)
- [Credits](#credits)
## Project Overview
### Task:
Create a simple application that, using an API, displays a list of cat (or dog) breeds with photos in a grid layout. When clicking on a cell, a page with detailed information about the breed should open.

### API Used:

## The Cat API
### Features
- Display cat breeds in a grid layout using photos.
- Show detailed information for each breed upon selection.
- SwiftUI is used for the interface.
- Caching implemented for images and breed details.
- Unit tests written for the application's logic.
- Async/await used for asynchronous operations.
- Core separated into specific modules:
  - CoreUI
  - CoreNetworking
  - CoreModel
- Additional bonuses implemented:
  - Lazy loading for efficient data fetching.
  - Landscape support for better orientation handling.
  - Text search to filter breeds by name.
## Architecture
The application is structured following best practices with a clear separation of concerns into modules: CoreUI, CoreNetworking, and CoreModel. This allows for better modularity and maintainability.

- CoreUI: Handles the layout and presentation of the user interface using SwiftUI.
- CoreNetworking: Manages all networking tasks, such as fetching data from The Cat API.
- CoreModel: Contains model definitions and business logic.
## Technologies Used
- Swift 6
- SwiftUI
- SwiftTesting for unit tests
- Async/Await for managing asynchronous code
- Modular architecture
## Installation
### To run the project locally:

- Clone this repository:

```
git clone git@github.com:OleksiiMykhalchuk/CatsInfo.git
cd CatsInfo
```
- Open the project in Xcode.

- Build and run the project on a simulator or a physical device.

## Screenshots

<img width="308" alt="Screenshot 2025-01-02 at 19 59 13" src="https://github.com/user-attachments/assets/46fa6c5d-29a9-4981-a330-334bb684e463" />
<img width="308" alt="Screenshot 2025-01-02 at 19 59 20" src="https://github.com/user-attachments/assets/52020d49-f28f-42c7-ac59-275c12f0856b" />


## Time Spent
The total time spent on this task was approximately 6 hours, including planning, coding, testing, and optimizing features.

## Credits
This application utilizes The Cat API for obtaining cat breed data and images. Special thanks to the API providers for making this possible.

Enjoy exploring different cat breeds! 😺




