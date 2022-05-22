1. Several main pages are borrowed from the foodpanda software 2. All data are placed in the local Restaurants.plist file, which can be modified as needed, but do not change his structure 3. The MVC architectural pattern is adopted 4. All interface UIs are implemented in Main.storyboard by dragging and dropping controls. 5. Most pages are based on tableView to achieve most layouts using StakView

--- Below the Home file directory is the home page content HomeViewController This page is just a static page for display, except that clicking View will enter the restaurant RestaurantViewController page, there is no other interaction

---Restaurants restaurant and food list

RestaurantsViewController gets the data from the local Restaurants.plist and transfers the model data through the array to display the model data on the page. Pass the corresponding tableView cell data to the next food details page through the connection

RestaurantsFoodViewController displays some information about the restaurant at the top The list displays the restaurant's popular food

Click on the food list will pop up the order page, you can click AddFoodViewController

Click on the restaurant information at the top to jump to the restaurant details page RestaurantDetailViewController The details page displays restaurant information, guest reviews and restaurant location map

---Cart shopping cart

After adding food, the data will be stored locally in the order management CartViewController will display the local shopping cart data

The quantity of food in the shopping cart can be modified and deleted

Before confirming the order, you need to add the payment method PaymentMethodViewController and the address AddAddressViewController

At the same time, if the shopping cart has data, address, and payment method, you can place an order. It will prompt OrderCompleteViewController to place the order successfully.



