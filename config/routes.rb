Rails.application.routes.draw do
  resources :high_scores, only: [:index, :new]

  engine = Class.new(Rails::Engine) do
    def self.inspect
      "Blog::Engine"
    end
  end
  engine.routes.draw do
    get "/cart", to: "cart#show"
  end
  mount engine => "/blog", :as => "blog"
end
