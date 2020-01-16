

## posts テーブル 
|Column|Type|Options|
|------|----|-------|
|title   |text   |null: false|                                   <!-- タイトル -->
|content   |text   |null: false|                                   <!-- 記事 -->
|user_id  |integer|null: false, foreign_key: true|           <!-- 外部キー-->


### Association
has_many :likes
has_many :addresses
has_many :commnets
has_many :items
has_many :reviews
