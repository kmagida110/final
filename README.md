# Road Trip Finder

This project will provide different routes (for road trips or sightseeing) around the US. The main page will be a map with all the routes that a user has selected drawn in. The user will also be able to see detailed information about each route that the areas they will pass through. 

The database will be seeded with all the states and many major cities with descriptive information that can be added in bulk. A few routes and landmarks will also be added as a base and more can be added. There will also be the option to add cities but it will either require the user to know that lat/long or require a call to the Google API.

Ideally the seeding of the databases will be done automatically through an API call to the census or a similar site.

# Live online
This app is live online at cryptic-taiga-86428.herokuapp.com.

# Resources

1. User - This will be a basic storage of information to allow people to log in and track their preferred routes
1. UserRoute - This will show which routes a user has "favorited" and which ones they have actually completed. This can be used in connection with other table to identify the number of cities that a given user has visited.
1. State - Information on states, hopefully this will be tied to the broader map and include interesting information about the states.
1. City - Similar to the state resource above but with more detailed information. I may find a way to bulkload cities which will reduce the custom information. It will be replaced by general demographic information or something else that I can get from datasources that can be bulkloaded.
1. Landmarks - These will be tied to cities and I will add in a customizable field that will allow users to add new landmarks (without site approval)
1. Routes - This will server as a collection of final routes, most of the actual information about the routes will be included in the Waypoint resource, this will just server as an overall storing place for the routes.
1. Waypoint - This is an intermediate table showing where cities and routes combine. It shows where each city in a route is relative to its neighbors and the distance between the cities. 
