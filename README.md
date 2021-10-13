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

 ## データベース設計


 ## ローカルでの動作方法