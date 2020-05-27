class Book < ApplicationRecord
	belongs_to :user
	#バリデーションは該当するモデルに設定する。エラーにする条件を設定できる。
	#presence trueは空欄の場合を意味する。
	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 200}
	# searchメゾットの定義

	def Book.search(search_word, option, choice)
        if option == "2"
            if choice == "1"
                    Book.where(['title LIKE ?', "#{search_word}%"])
            elsif choice == "2"
                    Book.where(['title LIKE ?', "%#{search_word}"])
            elsif choice == "3"
                    Book.where(['title LIKE ?', "#{search_word}"])
            elsif choice == "4"
                    Book.where(['title LIKE ?', "%#{search_word}%"])
            else
                    Book.all
            end
         end
    end

end
