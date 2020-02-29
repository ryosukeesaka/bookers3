class User < ApplicationRecord
    devise  :database_authenticatable, :registerable,
            :recoverable, :rememberable, :validatable

    validates :name, length: { in: 2..20 }
    validates :introduction, length: { maximum: 50 }

    has_many :books, dependent: :destroy
    has_many :post_comments, dependent: :destroy
    has_many :favorites, dependent: :destroy
    has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy#外部キーで指定しないとfollowerかfollowedどちらを取るか区別できない。
    has_many :followered, class_name: "Relationship", foreign_key: "followered_id", dependent: :destroy#フォロワー取得
    has_many :following_user, through: :follower, source: :followered # 自分がフォローしている人,through relationships??
    has_many :followered_user, through: :followered, source: :follower # 自分をフォローしている人 following?follower?

    def follow(user_id)
        follower.create(followered_id: user_id)#ユーザーをフォローする
    end


    def unfollow(user_id)
        follower.find_by(followered_id: user_id).destroy#ユーザーのフォローを外す
    end


    def following?(user)
        following_user.include?(user)#フォローしていればtrueを返す
    #binding.pry
    end

    def User.search(search, user_or_book, how_search)
        if user_or_book == "1"
            if how_search == "1"
                User.where(["name LIKE ?", "%#{search}%"])
            elsif how_search == "2"
                User.where(['name LIKE ?', "%#{search}"])
            elsif how_search == "3"
                User.where(['name LIKE ?', "#{search}%"])
            elsif how_search == "4"
                User.where(['name LIKE ?', "#{search}"])
            else

                User.all
            end
        end
    end




    attachment :profile_image

    enum gender: { man: 0, woman: 1, other: 2}

    enum prefecture: {
    "--未選択--":0,北海道:1,青森県:2,岩手県:3,宮城県:4,秋田県:5,山形県:6,福島県:7,
    茨城県:8,栃木県:9,群馬県:10,埼玉県:11,千葉県:12,東京都:13,神奈川県:14,
    新潟県:15,富山県:16,石川県:17,福井県:18,山梨県:19,長野県:20,
    岐阜県:21,静岡県:22,愛知県:23,三重県:24,
    滋賀県:25,京都府:26,大阪府:27,兵庫県:28,奈良県:29,和歌山県:30,
    鳥取県:31,島根県:32,岡山県:33,広島県:34,山口県:35,
    徳島県:36,香川県:37,愛媛県:38,高知県:39,
    福岡県:40,佐賀県:41,長崎県:42,熊本県:43,大分県:44,宮崎県:45,鹿児島県:46,沖縄県:47
  }

    enum age: { "0歳": 0, "1歳": 1, "2歳": 2, "3歳":3,}



end
