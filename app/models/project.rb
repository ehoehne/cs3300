class Project < ApplicationRecord
    validates_presence_of :title, :description  #added presence validators for title and description
end
