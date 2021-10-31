## アプリケーション名
recipe-share

## アプリケーション概要
 20代女性の社会人がペルソナ

『日々の献立を考えるのが面倒・自炊に時間を費やしたくない』
『レシピサイトで調べるも、意外と手の込んだものが多い・ひとり暮らしの家にない調味料が載っていることも多々あることから、お手軽なものが見つけにくい…』
という理由から自炊をしない女性のために、お手軽なレシピを発信できるサイトを実装しました。

## url
 https://recipe-share-36899.herokuapp.com/

 ## テスト用アカウント
 - email     hhh@test
 - password  hhhhhh123

 ## 利用方法
- ログイン後、レシピの詳細ページからコメント / レシピの新規投稿 / 検索が可能です。
- ログインされなかった場合、トップページのレシピ閲覧のみが可能です。

 ## 目指した課題解決
- 料理を作る前提ではなく、のユーザーに「もっと見てみたい」「作ってみようかな」と思っていただける仕様を目指しました。
現在の機能は基礎的な部分に過ぎないため、いいね機能やランダムでレシピを提案できる機能・複数タグの投稿機能など更なる機能の追加を行い、より楽しんで使用していただけるアプリケーションを目指します。

 ## 洗い出した要件

|         機能名        |               目的            |         ストーリー         |
| -------------------- | ---------------------------- | ------------------------- |
|     ユーザー管理機能    | 新規登録且つログイン済みのユーザーのみ<br>が使用できるようにするため | 新規登録且つログイン済みのユーザーが投稿<br>するボタンを押すと新規投稿ページへ遷移し、<br>投稿を行う事が可能になります
|        投稿機能       | 投稿ページからレシピの共有が可能です | 一つでも空欄があるとエラーメッセージが表示され<br>ます |
|        検索機能       | 好みのレシピを検索と選択を行う事が可能<br>です | キーワードを入力し検索ボタンを押すと、入力されたワードを含む投稿が表示されます |
|      コメント機能      | 投稿者と閲覧者がコミュニケーションを取<br>れるようにすることでSNS感覚で使用いた<br>だけます | レシピの詳細ページ下部のコメント欄から投稿者に<br>対してコメントを送信することができます |
|  コメントの即時更新機能  | リロードを行わずコメントが更新させる<br>ことで、ノンストレスで使用いただけます | コメント投稿時にリロードが行われない為スムーズ<br>にコメント投稿を行っていただけます |
| 投稿写真のプレビュー機能 | どの写真を選択したか確認することで写真<br>の選択ミスを防ぎます | 投稿ページから写真を選択すると選択した写真が表<br>示されます |
| 投稿写真の複数枚選択機能 | 料理初心者のユーザーに伝わりやすい投稿<br>内容になります | 一枚画像を選択すると更に写真の選択ボタンが表示<br>されます |


 ## 実装した機能についての画像やGIFおよびその説明
- ユーザー管理機能
[![Image from Gyazo](https://i.gyazo.com/919ad06332abcdab82a7527b2e76bb56.gif)](https://gyazo.com/919ad06332abcdab82a7527b2e76bb56)

- 投稿機能
[![Image from Gyazo](https://i.gyazo.com/5756e4676589b318ac4a27a4d9b8bf39.gif)](https://gyazo.com/5756e4676589b318ac4a27a4d9b8bf39)

- 検索機能
[![Image from Gyazo](https://i.gyazo.com/eb98e0c3fc0def29062bad21360906d1.gif)](https://gyazo.com/eb98e0c3fc0def29062bad21360906d1)

- コメント機能 / 即時更新機能
[![Image from Gyazo](https://i.gyazo.com/a89142806508a9c2408a88298087385d.gif)](https://gyazo.com/a89142806508a9c2408a88298087385d)

- 投稿画像の複数選択機能 / 選択した画像のプレビュー機能
[![Image from Gyazo](https://i.gyazo.com/e9fc9bd82c790e0a9a0a6e2817798c4c.gif)](https://gyazo.com/e9fc9bd82c790e0a9a0a6e2817798c4c)


 ## 実装予定の機能
 - ユーザー管理機能
 - 投稿機能
 - 検索機能(タグに紐付いたレシピの表示)
 - コメント機能
 - コメント投稿時の即時更新機能
 - 選択した写真のプレビュー機能
 - 投稿時に複数の写真の選択機能

 - レシピのランダム提案機能
 - いいね機能
 - SN認証の導入

 ## ローカルでの動作方法

 ## データベース設計
 [![Image from Gyazo](https://i.gyazo.com/753218686f8cdb87f8e14f7f3e9725a8.png)](https://gyazo.com/753218686f8cdb87f8e14f7f3e9725a8)


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


