class StaticController < ApplicationController
  def home
  end

  def about
    render text: "Hello, world!"
  end
end
