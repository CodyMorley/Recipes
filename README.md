# Recipes
A coding challenge for Fetch


### Steps to Run the App

Pull the contents of the repo and run the .xcodeproj file using XCode. Use the play button to run the app in simulation. 

### Focus Areas: What specific areas of the project did you prioritize? Why did you choose to focus on these areas?

I prioritized clean and scalable architecture, proper error and state handling along with testability and performance.

### Time Spent: Approximately how long did you spend working on this project? How did you allocate your time?

I spent approximately 6.5 hours on this project Sunday, 12/15/24. THe initial prototype and network controller took me approximately 2 hours. Then I spent approximately 1.5 hours refactoring views to be more composable as well as conforming to the mvvm design pattern in the master list view to better organize its' state handling. After that I spent approximately 3 hours writing a suite of unit tests to cover the majority of the business logic in the project, end to end test all the features, and tweak UI irregularities.

### Trade-offs and Decisions: Did you make any significant trade-offs in your approach?

In the interests of time I decided to include preview and mock classes for end to end logic tests while foregoing UI tests. In a professional setting i'd probably have spent 2-4 hours writing some automated testing for the UI. I also did not prioritize bells and whistles in the UI. Certainly with more time i'd include a few animations and some color theming beyong light and dark mode (which are supported). Finally I left off both a search and filtering UI function on the list, however the project is easily extendable for these features.

### Weakest Part of the Project: What do you think is the weakest part of your project?

As previously stated the UI is a bit plain.

### Additional Information: Is there anything else we should know? Feel free to share any insights or constraints you encountered.

I had a lot of fun with this project. I appreciate the opportunity and look forward to talking it through with you soon!


Best,
Cody Morley
