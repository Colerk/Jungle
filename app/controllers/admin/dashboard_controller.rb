class Admin::DashboardController < ApplicationController

  http_basic_authenticate_with name: "Jungle", password: "book"

  def show
    @totalp ||= Product.all.count()

    @totalc ||= Category.all.count()

  end
end
