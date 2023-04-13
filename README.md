
# アプリケーション名
KAKKO
  
「カッコいい!!」「カッコわるい...」は人それぞれ！  
あなたのお気に入りのサイトを見つけよう！

# アプリケーション概要
好きなwebサイトをシェアし、ユーザー同士でレビューの投稿ができるアプリケーション

# URL
https://kakko.onrender.com/

# テスト用アカウント
Basic認証   
ID/Pass   
admin/0128

太郎    
メールアドレス：
taro@taro.com   
パスワード：
taro2222

# 利用方法

- ユーザーが参考になると思ったサイトを投稿することができる。
- 投稿されたサイトに対して、評価を記録することができる。次の項目を５段階評価。①総合評価②雰囲気③見栄え④使いやすさ⑤実用的
- 投稿されたサイトに対して、コメントを残し何が良かったかを記録できる。
- 投稿されたサイトに対して、お気に入り登録することができる。お気に入りした投稿はマイページから閲覧できる。

# アプリケーションを作成した背景

HPを作成するときに、顧客から「とにかくかっこいいサイトを作って欲しい」とよく言われることがあった。  
しかし、「かっこいい」の基準は人それぞれなので具体的にしていく必要がある。  
そこで、「かっこいい」と思った参考サイトを顧客が投稿できるようにした。  
また、「かっこいい」と思えた評価基準を明確にし、なぜ「かっこいい」と思えたのか、５段階評価とコメントで記録できるようにした。  
そうすることで、顧客が「かっこいい」と思うサイトや、「かっこいい」の正体をより明確にし、HP制作において活かせるようにした。  

※HPの参考サイトは多数あるが、カッコいいと思ったサイトのレビューを保存して残しておける場がなかった。

# 洗い出した要件
[要件を定義したシート](https://docs.google.com/spreadsheets/d/1wwJFmvm50SVcCLQnHgr3pt3OvTujp61B4wKMpTBltT0/edit#gid=982722306)


# 実装した機能についての画像やGIFおよびその説明

## TOPページ
[![Image from Gyazo](https://i.gyazo.com/45e2618b6b826b6be512aea8360f218c.jpg)](https://gyazo.com/45e2618b6b826b6be512aea8360f218c)
投稿されているサイトは全てのユーザーに表示される

## マイページ  
[![Image from Gyazo](https://i.gyazo.com/a7db5d9b897a80084b541bee2bfe00bd.gif)](https://gyazo.com/a7db5d9b897a80084b541bee2bfe00bd)
マイページでは、自分の投稿とお気に入りしたサイトを表示できる  

## レビューの投稿
[![Image from Gyazo](https://i.gyazo.com/be025c50d7ace2b073abd44f8bcb834f.gif)](https://gyazo.com/be025c50d7ace2b073abd44f8bcb834f)
投稿されたサイトに評価を残すことができる

# 実装予定の機能
- より便利にするため  
フォロー管理機能、平均評価表示機能、ランキング機能
- ユーザーを増やすため  
SNSログイン機能、SNS共有機能

# データベース設計
![kakko](https://user-images.githubusercontent.com/125962323/231728156-01a5aac5-5072-4f40-8269-04fff9f38665.png)

# 画面遷移図
<img width="1433" alt="kakko gamen" src="https://user-images.githubusercontent.com/125962323/231770644-1f1dbd35-18b9-418f-b96e-d56a964d9b5b.png">

# 開発環境
- フロントエンド
- バックエンド
- テスト
- テキストエディタ

# ローカルでの動作方法
以下のコマンドを順に実行  
% git clone https://github.com/molitomoki/kakko.git   
% cd xxxxxxxxx    
% bundle install  
% yarn install

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
| url                | string       | null: false                    |
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