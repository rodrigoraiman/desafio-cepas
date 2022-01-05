class Cepa < ApplicationRecord
    has_many :cepa_vinos
    has_many :vinos, through: :cepa_vinos
end
