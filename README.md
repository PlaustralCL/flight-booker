# Flight Booker

## Description
Build a basic one-way flight search and booking app. The flight data is made up, but based on realistic flight times. The purpose of the project was to practice using more advanced forms in Rails, including drop downs menus and radio buttons. This project also used nested forms.
Phase 2 of the project added email confirmations sent to each passenger's email.

A more complete description of the project is on [The Odin Project - Flight Booker](https://www.theodinproject.com/lessons/ruby-on-rails-flight-booker) and [The Odin Project - Email confirmations](https://www.theodinproject.com/lessons/ruby-on-rails-sending-confirmation-emails).

Repository: [Github](https://github.com/PlaustralCL/flight-booker)

Live preview: https://obscure-inlet-69558.herokuapp.com/

## Reflections
* Successfully created a nested form
* Learned that Rails magic will create the correct number of [[form inputs|rails.forms]] if the form is set up correctly
* Added a background image while using Bulma for styling. This was trickier than it should have been.
* As much as I like Bulma, it may be better to write my own CSS next time. Bulma is good for creating an app quickly that looks better than default HTML, but I felt like I was fighting the framework towards the end.
* Created a static About page. Using the basic Rails framework, I was able to create a controller that should be able to handle multiple static pages in the future.

## Future enhancements
* Add validations to models to prevent the creation of invalid instances
* Search bookings by person's email
* Allow each person to book a specific flight (date, date, route) only once
* Customize the [[color palette|top.flight-booker.notes#color-palette]]
* List departure and arrival times in the local (to the airport) timezones. Currently the times were shown relative to the user's timezone.
* Add tests

## Acknowledgements
* Much of the CSS came from [Bulma](https://bulma.io/).
* The background image is by [Wolfgant Hasselmann on Unsplash](https://unsplash.com/photos/tUajw5SrNSo).
