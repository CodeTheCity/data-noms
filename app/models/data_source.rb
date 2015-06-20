class DataSource < ActiveRecord::Base
  belongs_to :format

  validates :name, :url, :format, presence: true
end
