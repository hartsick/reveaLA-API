# ReveaLA API

The Rails-based API for ReveaLA, a location-based interactive scavenger hunt for finding hidden and historical spots in Los Angeles.

###Documentation

* API Docs: [https://gist.github.com/hartsick/6f03d95e3d0aed17547a](https://gist.github.com/hartsick/6f03d95e3d0aed17547a)

###Getting Started

* Create database
		
		rake db:create
	
* Configure PostGIS
	* [Install PostGIS](http://postgis.net/install/all/)

	* Enable PostGIS in development, testing, and production databases:
			
			in psql: CREATE EXTENSION postgis;
		
						
* Run migrations & seed database
		
		rake db:migrate
		rake db:seed


###Additional components:

* ReveaLA Angular (for web): [https://github.com/kelseyledford/reveaLA-angular](https://github.com/kelseyledford/reveaLA-angular)

* ReveaLA API: [https://github.com/hartsick/reveaLA-API](https://github.com/hartsick/reveaLA-API)

* ReveaLA Ionic (for mobile): [https://github.com/kelseyledford/reveaLA-ionic](https://github.com/kelseyledford/reveaLA-ionic)

---

###### Created by: 
* Christa Hartsock ([@hartsick](http://github.com/hartsick))

* Kelsey Ledford ([@kelseyledford](http://github.com/kelseyledford))

* Mike Wong ([@mikewong79](http://github.com/mikewong79))

with **Ruby on Rails**, **Rails-API**, **Capistrano**, **PostGRESql**, and **PostGIS** 

for **General Assembly** LA's Web Development Immersive 5/6, Project 4
