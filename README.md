## テーブル設計
アプリケーション名
 Part of life

アプリケーション概要
 透析患者の、日々の水分や食事内容などの体調管理を記録するアプリケーション。
 透析手帳など、紙での記載が多い中、携帯の中で透析患者自身の日々の体調・生活を記録できる。
URL
 https://lifestyle-tgde.onrender.com
 
テスト用アカウント
 ・Basic認証パスワード:2222
 ・Basic認証ID:admin
 
利用方法
アプリケーションを作成した背景
 前職にて病院の透析室に勤務していた際、透析患者が日々の水分管理や食べたもの等を用紙や透析手帳などに手書きで記録していた。
 しかし、仕事などで外出の多い40〜70代の方達は、そのノートを持ち歩くのをよく忘れてしまったり、周りの目を気にして、記録をしないという状況があった。
 課題を分析した結果、人目を気にせず、常に持ち歩くものに記録することが出来ると、記録するという習慣も身につき、かつ容易に記録しやすいのではないかという仮説を立てた。
 また調査した結果、透析自体の管理や食事管理に対してのアプリは見られるが、透析患者の生活の記録についてのアプリはほとんど見当たらなかった。同様の課題を抱えている透析患者も多いと推測し、透析患者が携帯のアプリで毎日の水分管理や食事内容の記録など、体調管理に関わる記録ができるアプリケーションを開発することにした。

洗い出した要件
 要件を定義したシート
実装した機能についての画像やGIFおよびその説明
 
実装予定の機能
 現在、データベースを実装中。
 今後はログイン機能や水分管理や食事内容などを記録する機能を実装予定。
データベース設計
画面遷移図
開発環境
 ・フロントエンド
 ・バックエンド
 ・インフラ
 ・テスト
 ・テキストエディタ
 ・タスク管理
 
ローカルでの動作方法
 % git clone 
 % cd projects/lifestyle
 % bundle install
 % yarn install

工夫したポイント
 どのようにしたら、若い人だけではなく高齢の方も使いやすくなるのかを考え、できるだけ入力・操作しやすいように、入力する場所を１箇所にまとめた。
また、入力したものを一覧表示できるようにした。




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
- has_many :objective_lifestyles


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
- has_many   :objective_lifestyles
- has_many   :objectives, through::objective_lifestyles
- belongs_to :user
- belongs_to_active_hash :date


## objectives テーブル

| Column                    | Type       | Options                         |
| ------------------------- | ---------- | ------------------------------- |
| date                      | date       | null: false                     |
| goal                      | text       | null: false                     |
| performance               | integer    |                                 |
| inventory                 | text       |                                 |
| user                      | references | null: false, foreign_key: true  |

### Association
- has_many   :objective_lifestyles
- belongs_to :user
- has_many   :lifestyles, through::objective_lifestyles
- belongs_to_active_hash :date
- belongs_to_active_hash :performance


## objective_lifestyles テーブル

| Column                    | Type         | Options                        |
| ------------------------- | ------------ | ------------------------------ |
| objectives                | references   | null: false, foreign_key: true |
| lifestyles                | references   | null: false, foreign_key: true |

### Association
- belongs_to :objective
- belongs_to :lifestyle