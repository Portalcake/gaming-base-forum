Forum::Engine.routes.draw do

  scope "/:locale/forum" do
    resources :topics do
      resources :posts, :except => [:show, :index]
    end
  end

end
