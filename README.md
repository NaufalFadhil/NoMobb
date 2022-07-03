# NoMobb
Capstone Project created by Student at Backend Engineer Generasi GIGIH 2.0

NoMobb stands for No Mobbing. “No” comes from English which means no and “mobbing” is a term used in several countries such as Norway, Finland and Denmark which means bullying. That way no mobbing can be interpreted as "say no to bullying".

Through a lot of information and issues that can be read and viewed from social media or from the internet, there are many cases of bullying that occur in everyday life, especially in education terms, such as schools. NoMobb is here to answer these questions. Through this application, victims of bullying will receive guidance in the form of counseling from professionals to entertain and provide advice to them. In fact, they can communicate with other people with the same fate as them (victims of bullying) through a community formed through the NoMobb application, so they will not feel alone and can get in touch with one another.

## Prerequisites
<img alt="Ruby" src="https://img.shields.io/badge/RUBY-3.1.2-CC342D?style=for-the-badge&logo=ruby&logoColor=white&color=323330&labelColor=CC342D"/>
<img alt="Rails" src="https://img.shields.io/badge/RAILS-7.0.3-CC0000?style=for-the-badge&logo=ruby&logoColor=white&color=323330&labelColor=CC0000"/>
<img alt="Sqlite3" src="https://img.shields.io/badge/SQLITE3-3.38.5-07405e?style=for-the-badge&logo=ruby&logoColor=white&color=323330&labelColor=07405e"/>

## Get Started
Clone the repository
```
git clone https://github.com/NaufalFadhil/NoMobb.git
```
Install project dependencies
```
bundle install
```
Migrate database
```
bundle db:migrate
```
Run the server
```
rails server
```
If want data dummy (optional)
```
rails db:seed
```
Run test
```
rspec -fd
```

## API Documentation (Postman)
[https://postman.com/naufalfadhil/workspace/nomobb](https://www.postman.com/naufalfadhil/workspace/nomobb/overview)

## Entity Relational Database
![NoMobb - ERD drawio (3)](https://user-images.githubusercontent.com/52705188/177049085-d5d4d44e-4190-44d0-bfbd-f33f54479cb1.png)

## Features
- Report (api/reports)
- Checker (api/checker)
- Consulting (api/consultation_message)
- Community (api/community)

# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
