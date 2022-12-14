# ながのCAKE
## 概要
長野県にある小さな洋菓子店「ながのCAKE」の商品を通販するためのECサイト開発。
元々近隣住民が顧客だったが、昨年始めたInstagramから人気となり、全国から注文が来るようになった。InstagramのDMやメールで通販の注文を受けていたが、情報管理が煩雑になってきたため、管理機能を含んだ通販サイトを開設しようと思い至った。
## 通販について
- 通販では注文に応じて製作する受注生産型としている。
- 現在通販での注文量は十分に対応可能な量のため、1日の受注量に制限は設けない。
- 送料は1配送につき全国一律800円。
- 友人や家族へのプレゼントなど、注文者の住所以外にも商品を発送できる。
- 支払方法はクレジットカード、銀行振込から選択できる。
## 実装機能
### 1.会員側機能
- 顧客は会員登録、ログイン・ログアウト、退会ができます。
- 会員のログインはメールアドレスとパスワードで⾏えます。
- 会員がログインしている状態だと、ページのヘッダーにユーザ名が表示されます。
- サイトの閲覧はログインなしで⾏えます。
- 商品をカートに⼊れ、1 度に複数種類、複数商品の購⼊ができます。また、カート 内の商品は個数変更・削除ができます。
- カートへの商品追加はログインなしでは⾏えません。
- クレジットカード情報はシステム上保持されません。
- 会員はマイページからユーザ情報の閲覧・編集、注⽂履歴の閲覧、配送先の閲覧・ 編集ができます。
- 注⽂履歴⼀覧には下記の情報が表⽰されます。
  - 注⽂⽇
  - 配送先
  - ⽀払⾦額(商品合計＋送料)
  - 注⽂ステータス
- 注⽂履歴詳細には下記の情報が表⽰されます。
  - 注⽂⽇
  - 配送先
  - ⽀払⽅法
  - 注⽂ステータス
  - 商品の注⽂内容詳細（商品名、単価、個数、⼩計）
  - 請求情報（商品合計、送料、⽀払⾦額） 会員登録時、下記の情報をユーザ情報として⼊⼒できます。
  - 名前（姓・名）
  - 名前（カナ姓・カナ名）
  - 郵便番号
  - 住所
  - 電話番号
  - メールアドレス
  - パスワード
- 商品は税込価格で表⽰されます。（消費税 10％）
### 2.管理者側機能
- 管理者⽤メールアドレスとパスワードでログインできます。
- 商品の新規追加、編集、販売停⽌（売切表⽰）が⾏えます。
- 商品情報は下記のものを保持しています。
  - 商品名
  - 商品説明⽂
  - ジャンル
  - 税抜価格
  - 商品画像
  - 販売ステータス
- 会員登録されているユーザ情報の閲覧、編集、退会処理が⾏えます。
- ユーザの注⽂履歴が⼀覧・詳細表⽰できます。
- 注⽂履歴には注⽂ごとに下記の情報が表⽰されます。
  - 購⼊者
  - 購⼊⽇
  - 購⼊内容
  - 請求額合計
  - 配送先
  - 注⽂ステータス
  - 各注⽂商品の製作ステータス
- 注⽂ステータス、製作ステータスの更新ができます。
- 商品ジャンルには「有効」「無効」を設定できます。無効に設定したジャンルは、ジャンル⼀覧に表⽰されません。また、無効になっているジャンルに紐付く商品は表⽰されません。
### 3.用語の定義
|用語|意味|
|--|--|
|顧客|ながのCAKEの商品を購入する人（客）|
|会員|ECサイトにユーザー登録している顧客|
|ECサイト|顧客が利用するサイト|
|管理サイト|店で働く事務員・パティシエ等が利用するサイト（管理者用サイト）|
|注文ステータス|注文の状態遷移を表す（後述）。|
|製作ステータス|注文に紐付く注文商品の状態遷移を表す（後述）。|
|販売ステータス|商品の販売状況を表す。現状、販売中、売切れの2パターンがある。販売停止商品は「売切れ」をセットする。|
|会員ステータス|現状、有効・退会の2パターンがある。|
|ジャンル|商品の種類|
|注文個数|1回の注文に紐付く注文個数の合計。例）商品Aを3個、商品Bを2個注文→注文個数は5。|
|商品小計|商品単価（税込）×個数。例）1,200円（税込）の商品を2個購入＝商品小計は2,400円|
### 4.各種ステータス
<table>
<tr>
  <th>ステータス名</th>
  <th>用途</th>
  <th>ステータス</th>
  <th>設定タイミング</th>
</tr>
<tr>
  <td rowspan="5">注文ステータス</td>
  <td rowspan="5">注文状況を表す。会員の購入履歴にも表示する。</td>
  <td>入金待ち</td>
  <td>注文時にデフォルトで設定</td>
</tr>
<tr>
  <td>入金確認</td>
  <td>管理者側が入金を確認したら設定</td>
</tr>
<tr>
  <td>製作中</td>
  <td>紐づく注文商品の制作ステータスが1つでも「制作中」になったらになったら自動更新</td>
</tr>
<tr>
  <td>発送準備中</td>
  <td>紐づく注文商品の制作ステータスが全て「制作完了」になったら自動更新</td>
</tr>
<tr>
  <td>発送済み</td>
  <td>管理者側が発送完了時に設定</td>
</tr>
<tr>
  <td rowspan="5">制作ステータス</td>
  <td rowspan="5">各商品の制作状況を表す。管理者側のみ表示。</td>
  <td>着手不可</td>
  <td>注文時のデフォルトで設定</td>
</tr>
<tr>
  <td>制作待ち</td>
  <td>紐づく注文ステータスが「入金確認」になったら自動更新</td>
</tr>
<tr>
  <td>制作中</td>
  <td>制作着手する際に管理者側が設定</td>
</tr>
<tr>
  <td>制作完了</td>
  <td>制作が完了したら設定</td>
</tr>
</table>

## 開発環境
clound9
### 使用言語
- HTML&CSS（SCSS）
- Ruby
- JavaScript
### フレームワーク
- Ruby on rails(6.1.7)
### Gem
- bootstrap
- devise
- jquery-rails
- kaminari
- pry-byebug
## インストール
~~~
$ git clone git@github.com:OurLegend/nagano-cake.git
$ cd nagano-cake
$ rails db:migrate
$ rails db:seed
$ bundle install
~~~
## 使用方法
### 顧客側
1. はじめに会員登録をお願い致します。登録なしに商品を閲覧することは可能ですが、注文する際は必須になります。  
2. お好きな商品が見つかりましたらカートに入れていただき、注文情報入力へお進みください。  
3. 支払い方法、配送先等を選択していただき、注文確定を押すと注文が完了いたします。  
### 管理者側
1. はじめにログインをお願いいたします。 【メールアドレス:test@test.com　パスワード:123456】
2. ジャンルと商品を登録していただきますと、顧客サイトで閲覧が可能になります。  
3. 顧客から注文がありますと、注文一覧に表示され、詳細が確認できます。入金が確認できたら注文ステータスを変更し、製作が終了しましたら製作ステータスを変更してください。（それぞれ連動して変更が反映されます）  
4. 顧客一覧から顧客詳細の確認・変更・退会が可能です。
## 作成者
【俺たちの伝説】 﨑山瑛介　須藤巧平　穴原翔太　髙村文仁
