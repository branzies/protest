class StaticPagesController < ApplicationController

def index
  @locations = Location.all
end

def new
  @location = Location.new
end

end
