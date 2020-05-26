#DB設計


##usersテーブル

|Column|Type|Option|
|------|----|------|
|id|integer||
|name|string|null: false|
|email|string|null: false|
|pass|string|null: false|

###Association

- has_many :messages
- has_many :users_groups
- has_many :groups, through: :users_groups


##messagesテーブル

|Column|Type|Option|
|------|----|------|
|id|integer||
|text|text||
|image|string||
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|
|time|timestamp|null: false|

###Association
belongs_to :user
belongs_to :group


##groupsテーブル

|Column|Type|Option|
|------|----|------|
|id|integer||
|name|string|null: false|

###Association
has_many :messages
has_many :users_groups
has_many :users, through: :users_groups


##users_groupsテーブル

|Column|Type|Option|
|------|----|------|
|id|integer||
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|

###Association
belongs_to :message
belongs_to :user





