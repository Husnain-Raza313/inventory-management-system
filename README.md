# Project Name : Inventory-Management-System

## Developed in : Rails 6.1

## Description:
It is an inventory management system and the motivation behind its development is to have a system, which tracks and manages product inventory, product sales, supply inventory, orders  and essential analytics and where admins and cashiers can easily coordinate with each other.

## Prerequisites:
To run this project locally, system needs to have following softwares installed

Git
Ruby [2.7.2]
Rails [6.1]
Postgresql [1.4.5]

## Setup
To run this project on your machine locally, following steps need to be taken:
  1. ### Clone the repo
  First of all you need to clone this repo through following command
  <code> git clone https://github.com/faizanahmad421/inventory-management-system.git </code>

  2. ### Install the Gems
  After cloning the repo, refer to the cloned repo through the terminal. then run the following command
  <code> bundle install </code>
  This will install all the gems of the project

  3. ### Install the packages
  After installing gems, run
  <code> npm install </code>
  This will install all the packages for the project

  4. ### Run the migrations
  After installing dependencies, run
  <code> rails db:migrate </code>
  This will run all the migrations and generate a DB schema.

  5. ### Run the seeds.rb
  To store the initial data into the database to make application usable, run command
  <code> rails db:seeds </code>
  This will store all the initial data present inside seeds.rb file in the database

  6. ### Initiate the server
  When the migrations are done, start the server using the following command
  <code> rails s </code>
  and then app can be viewed on localhost:3000/ address

## Assumptions

One must need to know the following assumptions about the project to make good use of it.

* 2 types of users can be registered on this app and each one of them will have seperate authorities.

  1. Admin
  2. Cashier

#### STEPS FOR MAKING A NORMAL USER, ADMIN

* Open Rails console using rails c in ur command line.
* Search for that user. e.g. user = User.first
* Add admin role to that user e.g. user.add_role(:admin)

##### Admin:

* Admin can check the analytics (Sales, Revenue, Number of Orders etc)
* Admin can keep check on the inventory
* Admin can view Suppliers List, add, delete and edit a supplier.
* Admin can view Categories List, add, delete and edit a category.
* Admin can view Brands List, add, delete and edit a brand.
* Admin can view Products List, add, delete and edit a Product.

#### Cashier:

* Cashier can view Orders List, add, delete and edit an order.
* Cashier can checkout orders.
* Cashier can view Products, cannot edit or delete Products.
