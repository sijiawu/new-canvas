# KANVAS

Important note to self: 

 > Apparently when you are running in production mode the database schema is cached. So whenever you do a migration, you need to follow it up with a heroku restart command for the updated schema to load.

 This is "restart all dynos" in Heroku UI.