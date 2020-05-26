# DB設計


## usersテーブル

|Column|Type|Option|
|------|----|------|
|name|string|add_index, null: false|
|email|string|null: false|
|pass|string|null: false|

### Association

- has_many :messages
- has_many :user_groups
- has_many :groups, through: :user_groups


## messagesテーブル

|Column|Type|Option|
|------|----|------|
|text|text|add_index|
|image|string|add_index|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|

### Association
belongs_to :user
belongs_to :group


## groupsテーブル

|Column|Type|Option|
|------|----|------|
|name|string|add_index, null: false|

### Association
has_many :messages
has_many :user_groups
has_many :users, through: :user_groups


## user_groupsテーブル

|Column|Type|Option|
|------|----|------|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|

### Association
belongs_to :message
belongs_to :user





