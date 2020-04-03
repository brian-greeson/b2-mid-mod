Rails.application.routes.draw do

  get "/mechanics", to: "mechanics#index"
  get "/mechanics/:mechanic_id", to: "mechanics#show"

  get "/parks/:park_id", to: "parks#show"
end
