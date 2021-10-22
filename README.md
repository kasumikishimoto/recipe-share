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
- has_many :comments


## recipesテーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| title                | string     | null: false                    |
| material             | text       | null: false                    |
| text                 | text       | null: false                    |
| image                |            | null: false                    |
| user                 | references | null: false, foreign_key: true |
| category_id          | integer    | null: false                    |
| time_require_id      | integer    | null: false                    |

## Association

- belongs_to :user
- has_many :comments
- has_many :recipe_tag_relations
- has_many :tags, through: :recipe_tag_relations


## commentsテーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| recipe    | references | null: false, foreign_key: true |
| comment   | text       | null: false                    |

## Association

- belongs_to :user
- belongs_to :recipe


## tagsテーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| name                 | string     | null: false, uniquness: true   |

## Association

- has_many :recipe_tag_relations
- has_many :recipes, through: :recipe_tag_relations


## recipe_tag_relationsテーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| tag_id               | references | null: false, foreign_key: true |
| recipe_id            | references | null: false, foreign_key: true |

## Association

- belongs_to :recipe
- belongs_to :tag


## likesテーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| tag_id               | references | null: false, foreign_key: true |
| recipe_id            | references | null: false, foreign_key: true |

## Association

- belongs_to :recipe
- belongs_to :user


## アプリケーション名
recipe-share

## アプリケーション概要
- ユーザーの新規登録・ログイン・ログアウト機能
- 登録済みユーザーのレシピ投稿・レシピの詳細閲覧
- マイページのカレンダーにて、日々の食事の管理を記録できる

## url
 https://recipe-share-36899.herokuapp.com/

 ## テスト用アカウント

 ## 利用方法

 ## 目指した課題解決

 ## 洗い出した要件

 ## 実装した機能についての画像やGIFおよびその説明

 ## 実装予定の機能
 - ユーザー管理機能
 - 投稿機能
 - 投稿にタグ付け
 - 検索機能(タグに紐付いたレシピの表示)
 - コメント機能

 - いいね機能
 - 選択した写真のプレビュー機能
 - 投稿時に複数の写真の選択を可能にする機能

 ## データベース設計

 ## ローカルでの動作方法