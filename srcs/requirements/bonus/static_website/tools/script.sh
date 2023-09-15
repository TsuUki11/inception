#! /bin/bash

mv /profile-master/* /about-me/public

cd about-me

npm install nodemon --save-dev

npx nodemon npm start
