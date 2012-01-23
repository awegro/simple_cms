class AdminUser < ActiveRecord::Base
    
    scope :named, lambda {|first,last| where(:first_name => first, :last_name => last)}
      has_and_belongs_to_many :pages
    has_many :section_edits
has_many :sections, :through => :section_edits
end
