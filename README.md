# Road Trip Finder

This project will provide different routes (for road trips or sightseeing) around the US. The main page shows places that the user could go and the different routes in the system. If logged in the landmarks shown are ones that are not on any routes the user has added. The user will also be able to see detailed information about each route that the areas they will pass through. 

The route page shows the landmarks and cities that the route passes through and a Google Map of the route based on the pre-loaded lat/longs. 

The user account pages allows the user to select which routes they have completed and show the landmarks they have visited and the ones on routes they haven't visited. 

The database will be seeded with all the states and many major cities with descriptive information that can be added in bulk. A few routes and landmarks are included in the seed file and more can be added and edited. There is an option to add cities but it requires that the user input a lat/long. Since there are 1,000 cities pre-loaded this should not be much of an issue.

The database is seeded through two datasources referenced in the seeds file. Both of them came off of GitHub and include information on cities and states. City data includes the lat/long, population and state, state includes the capital city. Raw data is in the data file.

# Live online
This app is live online at http://cryptic-taiga-86428.herokuapp.com. Admin rights are associated with kyle@example.org, password: password.

# Resources

1. User - This will be a basic storage of information to allow people to log in and track their preferred routes
1. UserRoute - This will show which routes a user has "favorited" and which ones they have actually completed. This can be used in connection with other table to identify the number of cities that a given user has visited.
1. State - Information on states, hopefully this will be tied to the broader map and include interesting information about the states.
1. City - Similar to the state resource above but with more detailed information. I may find a way to bulkload cities which will reduce the custom information. It will be replaced by general demographic information or something else that I can get from datasources that can be bulkloaded.
1. Landmarks - These will be tied to cities and I will add in a customizable field that will allow users to add new landmarks (without site approval)
1. Routes - This will server as a collection of final routes, most of the actual information about the routes will be included in the Waypoint resource, this will just server as an overall storing place for the routes.
1. Waypoint - This is an intermediate table showing where cities and routes combine. It shows where each city in a route is relative to its neighbors and the distance between the cities. 
