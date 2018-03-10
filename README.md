# README
# mpcs52553-final

Greatreads is an online book club where people can talk about their favorite books. 

###Users and Permissions###

The “Users” tab in nav bar will only be displayed if the currently-logged-in user is admin. Other pages will also look different to admin because there are more actions.

Admin can CRUD books, users and authors. Users can only view the books, authors, search or leave reviews.  

If not logged in, one cannot leave comments. 

To log in as an admin: 
email: admin@example.org
password: admin

Other existing users:
email: user1@example.org, password: user1pw
email: user2@example.org, password: user2pw
email: user3@example.org, password: user3pw


###Notes to grader###

The deployed website on Heroku is: https://sijiawufinal.herokuapp.com/

Currently the way the system determines if admin is logged in is to look at the username and check if it’s admin. I know that this is a horrible practice but it seems too late now to make a change. In a real project, the user model should most likely have a permission level, like 10, 100, 255… I wish I had time to implement this properly. 

CSRF is a one-liner in application_controller.rb: protect_from_forgery with: :exception
