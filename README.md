![A photo of the DollarThoughts site](/screen-shot.png?raw=true "DollarThoughts")

DollarThoughts

Links:

Backend Repo: https://github.com/CoreyFedde/capstone-backend

Backend Deployed: https://thawing-dusk-42030.herokuapp.com/

Frontend Repo: https://github.com/CoreyFedde/capstone-front-ember

Frontend Deployed: https://coreyfedde.github.io/capstone-front-ember/

Concept: Web app containing easy to use financial wellness tools that help users visualize loans and interest payments, retirement investing, and general finances like rent-to-income
Stack: SQL -> Rails -> Ember

Approach:

I approached this project by starting with the backend. I created a Rails template
and focused on establishing the relationship between the Users resource and the
Loans resource. To simplify things, I started with a straight relationship with
Users has many Loans, with Users referenced on the Loans table with ids.

Next, I decided on the minimal number of user inputed properties I would need and
played with what information was available implicitly from those properties. I
found that when it comes to loans, much data is able to be derived from just having
the principal amount, interest rate, and length of the loan.

I took this information and used mathematic formula to create virtuals for those
properties. With this all in place, I then moved to my frontend.

Hurdles:

One of the biggest hurdles I encountered on this project was in the virtual
properties I created. Most of the documentation I saw and solution from sources
like Stock Overflow had the virtuals in the view, but in this case I was using a
client resource to control the view. Instead, I found I was able to put them in
the model.

However, I still experience difficulty in using the virutals with Ember. Ember
required me to list the properties I wanted to access in the frontend Loan model,
which included the virtuals. However, the properties set on the Loan model were
also serialized back up into POST and PUT requests sent to the Rails server,
which it rejected as unknown.

I was able to get around this on the frontend by using an adapter for the POST
and PUT requests.

Technologies used:

SQL, Ruby, Ruby on Rails

Within the rails server, I also used several virtual attributes which are
computed from properties that are used in equations.

Installation instructions:

After forking and cloning the repo, be sure to use Bundle Install.

ERD and wireframes: http://imgur.com/a/wiBth

User stories:

As a user, I want to be able to...

"visualize loans with principal + interest rates"

"visualize how much my rent takes up from my income"

"compare my finances to others in country, state, age group"

"visualize the retirement investing"

"compare paying down loans to investing in stocks or index funds"

"share my loans and retirements with other users"

A list of your API routes:
API end-points

Auth

Verb	URI Pattern	Controller#Action

GET	  /users	 users#index

GET	  /users/1	users#show

POST	/sign-up	users#signup

POST	/sign-in	users#signin

PATCH	/change-password/:id	users#changepw

DELETE	/sign-out/:id	users#signout

Loans

Verb	URI Pattern	Controller#Action

POST	/loans	loans#create

PUT	/loans/:id	loans#update

GET	/loans	loans#index

GET	/loans/:id	loans#show

DELETE	/loans/:id	loans#destroy
