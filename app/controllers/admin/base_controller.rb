class Admin::BaseController < ApplicationController

  http_basic_authenticate_with :username => "Jungle", :password => "book"


end
