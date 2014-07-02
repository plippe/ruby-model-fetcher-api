# Ruby Model Fetcher Api

### The environment
 - Build and install the models gem.


 - Create a database with the content of the resources/create.sql file.
 - Update the resources/database.yml file to point to your database.


 - Create an application an twitter to receive api keys.
 - Update the resources/twitter.yml file with the keys just received.


 - Run bundle install to download the dependencies.

### Running the application

- The fetcher populates the database with tweets from the twitter steam.
- The api gives access to those tweets via a restfull API


### Corners cut

 - No tests were written, use at your own risk
 - Commits were chaotic for fast results
 - Database path in resources/database.yml depends where the script is launched
