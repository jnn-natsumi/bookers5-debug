class SearchesController < ApplicationController

#検索機能実装　searchコントローラー作成①
  def search
   @option = params[:option]
   @choice = params[:choice]

   if @option == "1"
   	@users = User.search(params[:search_word], @option, @choice)
   else
   	@books = Book.search(params[:search_word], @option, @choice)
   end
  end

end

# private search 場合分け（if）
# book user 両方使えるsearchメゾットを作成する
# 切り替えのパラメータを入れる　（ex:userなら~)





