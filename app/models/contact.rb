class Contact < ApplicationRecord
    validates :name, presence: true
    validates :email, presence: true
    validates :content, presence: true
    validates :content, length: { maximum: 140 }
end
