class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :patterns
  has_many :datasets

  def full_datasets
    Dataset.standard + datasets
  end

  def self.root
    find_by(email: "nibbler@planetexpress.com")
  end
end
