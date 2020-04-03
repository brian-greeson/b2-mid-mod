Rails.application.routes.draw do

  get "/mechanics", to: "mechanics#index"

  get "/parks/:park_id", to: "parks#show"
end
