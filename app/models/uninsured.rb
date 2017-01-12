class Uninsured < ApplicationRecord
  belongs_to :day, counter_cache: true
end
