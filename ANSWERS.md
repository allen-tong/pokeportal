# Q0: Why is this error being thrown?
There is no Pokemon model.

# Q1: How are the random Pokemon appearing? What is the common factor between all the possible Pokemon that appear? *
'home#index' selects all Pokemon with no trainer from the seeded database, randomly samples one of them, and then passes it to the view. All the Pokemon that appear have trainer: nil.

# Question 2a: What does the following line do "<%= button_to "Throw a Pokeball!", capture_path(id: @pokemon), :class => "button medium", :method => :patch %>"? Be specific about what "capture_path(id: @pokemon)" is doing. If you're having trouble, look at the Help section in the README.
This renders a button with the label "Throw a Pokeball!", which, when clicked, submits a patch request to the page indicated by capture_path, with the id of the current Pokemon as an argument.

# Question 3: What would you name your own Pokemon?
MissingNo.

# Question 4: What did you pass into the redirect_to? If it is a path, what did that path need? If it is not a path, why is it okay not to have a path here?
I redirected to trainer_path, passing in the id of the Pokemon's trainer.

# Question 5: Explain how putting this line "flash[:error] = @pokemon.errors.full_messages.to_sentence" shows error messages on your form.
The line puts the error from the Pokemon not saving into the flash hash, which is then rendered by application.html.erb on the next page load.

# Give us feedback on the project and decal below!
This is fun!
The class was really confusing in the beginning, what with weird Ruby syntax and being thrown headfirst into MVCs, but there's probably not much that can be done about that other than just constant exposure. The most frustrating part of this class has probably been getting used to Ruby/Rails magic, so I think it would have been nice to slow down a bit in the beginning and maybe keep a running list of methods seen/used in the class so far and a table of pluralization rules and things Rails does automatically. A crash course on how to debug would be nice too. Aside from that, the lectures and assignments have been great (although unfriendly to Windows users :c rip) and I feel like I've learned a lot. Keep up the good work, A++ :)

# Extra credit: Link your Heroku deployed app
