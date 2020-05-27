class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,:validatable

  has_many :books
  attachment :profile_image,destroy: false

  #バリデーションは該当するモデルに設定する。エラーにする条件を設定できる。
  validates :name, presence: true, length: {in: 2..20 }
  # {maximum: 20, minimum: 2}
  validates :introduction, length: { maximum: 50 }

    def User.search(search_word, option, choice)
        if option == "1"
            if choice == "1"
                    User.where(['name LIKE ?', "#{search_word}%"])
            elsif choice == "2"
                    User.where(['name LIKE ?', "%#{search_word}"])
            elsif choice == "3"
                    User.where(['name LIKE ?', "#{search_word}"])
            elsif choice == "4"
                    User.where(['name LIKE ?', "%#{search_word}%"])
            else
                    User.all
            end
         end
    end


end
