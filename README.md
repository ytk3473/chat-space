# DB設計


## usersテーブル

|Column|Type|Option|
|------|----|------|
|name|string|null: false|
|email|string|null: false|
|pass|string|null: false|

### Association

- has_many :messages
- has_many :user_groups
- has_many :groups, through: :user_groups


## messagesテーブル

|Column|Type|Option|
|------|----|------|
|text|text||
|image|string||
|user_id|references|null: false, foreign_key: true|
|group_id|references|add_index, null: false, foreign_key: true|

### Association
belongs_to :user
belongs_to :group


## groupsテーブル

|Column|Type|Option|
|------|----|------|
|name|string|null: false|

### Association
has_many :messages
has_many :user_groups
has_many :users, through: :user_groups


## user_groupsテーブル

|Column|Type|Option|
|------|----|------|
|user_id|references|add_index, null: false, foreign_key: true|
|group_id|references|null: false, foreign_key: true|

### Association
belongs_to :message
belongs_to :user





