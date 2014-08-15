class Student < ActiveRecord::Base
has_many :addresses

accepts_nested_attributes_for :addresses

validates_presence_of :first_name
validates_presence_of :last_name
end