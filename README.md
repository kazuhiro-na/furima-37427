## usersテーブル

| Column         | Type   | Options     |
| ---------------| ------ | ----------- |
| nickname       | string | null, false |
| email          | string | null, false |
| password       | string | null, false |
| name(fullname) | string | null, false |
| name(Kana)     | string | null, false |
| birthday       | string | null, false |

### Association

- has_many :items
- has_many :purchase_records

## itemsテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| image         | image      | null, false                    |
| name          | string     | null, false                    |
| explanation   | text       | null, false                    |
| category      | string     | null, false                    |
| condition     | string     | null, false                    |
| burden        | string     | null, false                    |
| area          | string     | null, false                    |
| shipping_days | string     | null, false                    |
| price         | string     | null, false                    |
| user          | references | null, false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase_records

## purchase_recordsテーブル
| Column | Type       | Options                        |
| ----   | ---------- | ------------------------------ |
| user   | references | null, false, foreign_key: true |
| item   | references | null, false, foreign_key: true | 

### Association

- belongs_to :user
- belongs_to :item
- has_one :purchase_records

## shipping_addressesテーブル
| Column          | Type       | Options                       |
| --------------- | ---------- | ----------------------------- |
| postal_code     | string     | null, false                   |
| prefectures     | string     | null, false                   |
| municipalities  | string     | null, false                   |
| address         | string     | null, false                   |
| building        | string     |                               |
| tell            | string     | null, false                   |
| purchase_record | references | null, false, foreign_key: true|

### Association

- belongs_to :purchase_records