class Article < ApplicationRecord
    has_many :commentaires, dependent: :destroy
    validates :title, presence: true, length: {minimum: 5}
end
