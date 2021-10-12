# README

# テーブル設計


## usersテーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| nickname             | string     | null: false                    |
| email                | string     | null: false                    |
| encrypted_password   | string     | null: false                    |
| first_name           | string     | null: false                    | 
| last_name            | string     | null: false                    |

## Association

- has_many :recipes
- has


## recipesテーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| title                | string     | null: false                    |
| material             | text       | null: false                    |
| text                 | text       | null: false                    |
| memo                 | text       | null: false                    |
| image                |            | null: false                    |
| user                 | references | null: false, foreign_key: true |

## Association

- belongs_to :user
- has_many :comments


## calendersテーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| category             | string     | null: false                    |
| user_id              | references | null: false, foreign_key: true |

## Association

- has_one :user
