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

* Database design 
## usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true, add_index|
|email|string|null: false, unique: true|
|password|string|null: false|

### Association
- has_many: groups, through: group_users
- has_many: groups_users
- has_many: messages


## groupsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many: users, through: group_users
- has_many: groups_users
- has_many: messages

## groups_usersテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|


### Association
- belongs_to: user
- belongs_to: group_user

## messagesテーブル

|Column|Type|Options|
|------|----|-------|
|chat_message|text||
|chat_image|string||
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|


### Association
- belongs_to: user
- belongs_to: group_user