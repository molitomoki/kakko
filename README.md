

# テーブル設計

## users テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| email              | string | null: false, unique: true|
| encrypted_password | string | null: false              |
| name               | string | null: false              |

### Association

- has_many :posts
- has_many :reviews
- has_many :favorites 

## posts テーブル

| Column             | Type         | Options                        |
| ------------------ | ------------ | ------------------------------ |
| title              | string       | null: false                    |
| user               | references   | null: false, foreign_key: true |

### Association

- has_many :reviews
- has_many :favorites 
- belongs_to :user

## reviews テーブル

| Column             | Type         | Options                        |
| ------------------ | ------------ | ------------------------------ |
| total              | integer      | null: false                    |
| concept            | integer      | null: false                    |
| quality            | integer      | null: false                    |
| usability          | integer      | null: false                    |
| utility            | integer      | null: false                    |
| text               | text         |                                |
| post               | references   | null: false, foreign_key: true |
| user               | references   | null: false, foreign_key: true |

### Association

- belongs_to :post
- belongs_to :user

## favorites テーブル

| Column             | Type         | Options                        |
| ------------------ | ------------ | ------------------------------ |
| post               | references   | null: false, foreign_key: true |
| user               | references   | null: false, foreign_key: true |

### Association

- belongs_to :post
- belongs_to :user