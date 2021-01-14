class SharedController < ApplicationController
  before_action :authenticate_user!
end
