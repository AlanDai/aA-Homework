class House < ApplicationRecord
    validates :address, presence: true

    has_many(:residents, {
        primary_key: :id,
        house_id: :house_id,
        class_name: Person
    })
end
