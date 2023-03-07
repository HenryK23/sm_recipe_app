# sm_recipe_app
recipe app using flutter

# to download and setup
Clone repo and run app from the directory that has the .vscode folder in.
It is good practice to run 'Flutter clean' -> 'Flutter pub get' -> 'cd iod' -> 'pod update' -> 'pod install' before starting for the first time.
Due to a known DartVM bug it is also recommended to start the project without debugging as the cached_network_image will thrown exceptions that are already handled.
The API is on the free version and so can only handle 10 requests per minute. If you are having issues this is potentially what is happening. Sorry!

# Testing
Tests can be run by navigating to the /test folder in the project directory and either running the main file or run tests individually

# Project Structure
The project uses MVVM architecture where views(Pages) have a viewModel attached. Viewmodels have a .g file which is needed to run - if you cannot see these please run flutter clean and flutter pub get to refresh packages.

# Useful links: 
- This app uses the edamam recipe api which can be found here: https://developer.edamam.com/edamam-recipe-api
- The app was intially sketched out on a figma file which can be found here: https://www.figma.com/file/rU4Ir84Qh7aIkhRBWDfJwW/Screenmedia-app?node-id=0%3A3&t=gbhUaFXd38PsxJgi-0
- in lieu of having a proper dev op board a simple google doc was created to help with planning and ideating the app this document can be found here: https://docs.google.com/document/d/13y9LgFeuVrmAev7oVeupLZ8wiSx2RuddstjxlhTDlTg/edit?usp=sharing
