class StaticController < ApplicationController
layout 'sessions'
def welcome
  if logged_in
    redirect_to projects_path
  end

end
end
