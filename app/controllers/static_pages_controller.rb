class StaticPagesController < ApplicationController

def index
  @locations = Location.all
end

end
