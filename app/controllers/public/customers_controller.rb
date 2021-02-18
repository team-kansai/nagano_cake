class Public::CustomersController < ApplicationController

  def show
  end

  def edit
  end

  def unsubscribe
  end

  def update
  end

  def withdraw
    @customer = current_customer
    #現在ログインしているユーザーを@customerに格納
    @customer.update(is_deleted: "1")
    #updateで登録情報を退会済に変更
    reset_session
    #sessionIDのresetを行う
    redirect_to root_path
    #指定されたrootへのpath
  end

end