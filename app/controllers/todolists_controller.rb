class TodolistsController < ApplicationController

  def new
    @list = List.new
  end

  # 以下を追加
  def create
    list = List.new(list_params)
    list.save
    # redirect_to '/top' を削除して、以下コードに変更
    # 詳細画面へリダイレクト
    redirect_to todolist_path(list.id)  
  end

   def index
    @lists = List.all
   end
  
  def show
    @list = List.find(params[:id])
  end
  
  def edit
    @list = List.find(params[:id])
  end

  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to todolist_path(list.id)
  end
  
  def destroy
    list = List.find(params[:id])  # データ（レコード）を1件取得
    list.destroy  # データ（レコード）を削除
    redirect_to todolists_path  # 投稿一覧画面へリダイレクト
  end

  private
  # ストロングパラメータ
  def list_params
    params.require(:list).permit(:title, :body, :image)
  end
  
Refile.secret_key = '3edcd9c5b65ff436cc65e24c2e402d74aed49c0746bd443a2db2982657bf4264ed6a261ea66ceecbbe912d9c1c85d856be84fdc0b44c1e63dc75b8ede90d4a53'
end