git push origin master
compass compile
rake jammit_s3
git push heroku master
