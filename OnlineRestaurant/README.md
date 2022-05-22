# Home view
- This page (HomeViewController) is just a static page for display
- Clicking will move to RestaurantViewController

# Restaurant model
- RestaurantsViewController gets the data from the local Restaurants.plist and transfers the model data through the array to display the model data on the page. 
- Data will be map to restaurant model and display corresponding.

# Restaurant view
- RestaurantsFoodViewController displays some information about the restaurant 
- Top list displays the restaurant's popular food
- Click on the food will pop up order page, click to navigate to AddFoodViewController
- Click on the restaurant information at the top to jump to the restaurant details page RestaurantDetailViewController 
- The details page displays restaurant information, guest reviews and restaurant location map

# Cart view
- After adding food, the data will be stored locally
- CartViewController will display the local shopping cart data
- The quantity of food in the shopping cart can be modified and deleted using plus / subtract and delete button
- Before confirming the order, you need to add the payment method (via PaymentMethodViewController) and the address (via AddAddressViewController)
- If all condition has passed (food data, address, payment method), order will succeed and prompt to navigate to OrderCompleteViewController to place the order locally.

# Extra notes
- Several pages are borrowed from the FoodPanda software
- All data are placed in the local Restaurants.plist file, which can be modified but won't work if structure changed (require to follow current template)
- All interface UIs are implemented in Main.storyboard by dragging and dropping controls
- Most pages are created using tableView
- Most layouts are created using StakView
- MVC pattern are basic MVC, adopted from past projects


