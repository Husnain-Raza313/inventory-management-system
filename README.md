# Project Name : Inventory-Management-System

## Developed in : Rails 6.0

## Description:
It is an inventory management system and the motivation behind its development is to have a system, which tracks and manages product inventory, product sales, supply inventory, supply purchases, orders  and essential analytics and where admins and cashiers can easily coordinate with each other.

## Prerequisites:
To run this project locally, system needs to have following softwares installed

Git
Ruby [2.7.2]
Rails [6.0]
Postgresql db

## Setup
To run this project on your machine locally, following steps need to be taken:
  1. ### Clone the repo
  First of all you need to clone this repo through following command
  <code> git clone https://github.com/faizanahmad421/inventory-management-system.git </code>

  2. ### Run the migrations
  After cloning the repo, refer to the cloned repo through the terminal. then run the following command
  <code> rails db:migrate </code>
  This will run all the migrations and generate a DB schema.

  3. ### Run the seeds.rb
  To store the initial data into the database to make application usable, run command
  <code> rails db:seeds </code>
  This will store all the initial data present inside seeds.rb file in the database

  4. ### Initiate the server
  When the migrations are done, start the server using the following command
  <code> rails s </code>
  and then app can be viewed on localhost:3000/ address

## Important Gems used:

In this project, the gems which were used other than the default ones are mentioned below along with their usage

* Devise -> This gem was used for handling user authentication and basic functionalities like registration and login.
* ActiveStorage -> This gem was used to preview, store and use the screenshot of a supplier, admin, cashier, products, categories and brands.
* ActiveStorage Validatior -> This gem was used to validate the images (types and sizes).
* client_side_validations -> this gem was used for client side validations

## Assumptions

One must need to know the following assumptions about the project to make good use of it.

* 2 types of users can be registered on this app and each one of them will have seperate authorities.

  1. Admin
  2. Cashier

##### Admin:

* Admin can check the analytics (Sales, Revenue, Number of Orders etc)
* Admin can keep check on the inventory
* Admin can check Suppliers List, add, delete and edit a supplier.
* Admin can check Categories List, add, delete and edit a category.
* Admin can check Brands List, add, delete and edit a brand.

#### Cashier:

* Cashier can check Orders List, add, delete and edit an order.
* Cashier can check and create Transactions.
* Cashier can view Products, cannot edit or delete Products.
* Cashier can view Categories, cannot edit or delete Categories.
* Cashier can view Brands, cannot edit or delete Brands.
