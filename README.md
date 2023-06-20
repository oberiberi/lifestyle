
## アプリケーション名
-------
 Part of life

## アプリケーション概要
-------
 透析患者の、日々の水分や食事内容などの体調管理を患者自身が記録するアプリケーション。
 アプリで透析患者自身の日々の体調・生活を記録できる。

## URL
-------
 https://lifestyle-tgde.onrender.com

 <br>
 
## テスト用アカウント
-------
 ・Basic認証パスワード:2222<br>
 ・Basic認証ID:admin
 
 <br>

## 利用方法
-------
### 生活状況の投稿
&nbsp;1.トップページのヘッダーから新規登録を行う。<br>
&nbsp;2.トップページの1日の生活状況というボタンから、その日の状況（水分量・食事内容・運動状況・体調の状態）を入力し、新規投稿を行う。<br>
&nbsp;3.食事内容など記載するのが難しい場合は、写真に撮ったものを貼り付ける。

### 目標達成状況
&nbsp;1.トップページの「目標」ボタンをクリックして、目標入力画面に移動する。<br>
&nbsp;2.「気づいたこと」の欄には、自分の気づきがあれば記入する。
<br><br>

## アプリケーションを作成した背景
-------
 前職にて病院の透析室に勤務していた際、透析患者が日々の水分管理や食べたもの等を用紙や透析手帳などに手書きで記録していた。
 しかし、仕事などで外出の多い40〜70代の方達は、そのノートを持ち歩くのをよく忘れてしまったり、周りの目を気にして、記録をしないという状況があった。
 課題を分析した結果、人目を気にせず常に持ち歩くものに記録することが出来ると、記録するという習慣も身につき、かつ容易に記録しやすいのではないかという仮説を立てた。
 また調査した結果、透析自体の管理や食事管理に対してのアプリは存在するが、透析患者の生活の記録についてのアプリはほとんど見当たらなかった。同様の課題を抱えている透析患者も多いと推測し、透析患者が携帯のアプリで毎日の水分管理や食事内容の記録など、体調管理に関わる記録ができるアプリケーションを開発することにした。

<br>

## 洗い出した要件
-------
 要件を定義したシート
実装した機能についての画像やGIFおよびその説明

<br>
 
## 実装予定の機能
-------
 現在、データベースを実装中。
 今後はログイン機能や水分管理や食事内容などを記録する機能を実装予定。

<br>

 ## データベース設計
 -------
 [![Image from Gyazo](https://i.gyazo.com/b9d4847278654fef19374c547c406557.png)](https://gyazo.com/b9d4847278654fef19374c547c406557)

<br>

## 画面遷移図
-------
[![Image from Gyazo](https://i.gyazo.com/d44d29141ddafb1484c4915ca65fbdd5.png)](https://gyazo.com/d44d29141ddafb1484c4915ca65fbdd5)

<br>

## 開発環境
-------
 ・フロントエンド<br>
 ・バックエンド<br>
 ・インフラ<br>
 ・テスト<br>
 ・テキストエディタ<br>
 ・タスク管理<br>
 
## ローカルでの動作方法
-------
 % cd projects/lifestyle<br>
 % rails s

 <br>

## 工夫したポイント
-------
 どのようにしたら、若い人だけではなく高齢の方も使いやすくなるのかを考え、できるだけ入力・操作しやすいように、入力する場所を１箇所にまとめた。
 また、入力したものを一覧表示できるようにした。

<br><br>

## テーブル
-------
## users テーブル

| Column                   | Type       | Options                   |
| ------------------------ | ---------- | ------------------------  |
| nickname                 | string     | null: false               |
| email                    | string     | null: false, unique: true |
| encrypted_password       | string     | null: false               |
| last_name                | string     | null: false               |
| first_name               | string     | null: false               |
| last_name_kana           | string     | null: false               |
| first_name_kana          | string     | null: false               |
| birth_date               | date       | null: false               |

### Association
- has_many :objectives
- has_many :lifestyles

<br><br>
## lifestyles テーブル

| Column                    | Type       | Options                        |
| ------------------------- | ---------- | ------------------------------ |
| date                      | datetime   | null: false                    |
| weight                    | integer    |                                |
| food                      | text       |                                |
| moisture                  | integer    |                                |
| exercise                  | text       |                                |
| condition                 | text       |                                |
| comment                   | text       |                                |
| user                      | references | null: false, foreign_key: true |

### Association
- belongs_to :objective
- belongs_to :user
- belongs_to_active_hash :date

<br><br>
## objectives テーブル

| Column                    | Type       | Options                         |
| ------------------------- | ---------- | ------------------------------- |
| date                      | date       | null: false                     |
| goal                      | text       | null: false                     |
| performance               | integer    |                                 |
| inventory                 | text       |                                 |
| user                      | references | null: false, foreign_key: true  |

### Association
- belongs_to :user
- belongs_to :lifestyle
- belongs_to_active_hash :date
- belongs_to_active_hash :performance