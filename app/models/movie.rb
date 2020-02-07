class Movie < ApplicationRecord
  enum status: [:now_showing, :comming_soon]
end
