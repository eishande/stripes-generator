class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :patterns
  has_many :datasets

  after_create :create_default_dataset

  def create_default_dataset
    self.datasets ||= Dataset.create(user: self, name: "Example Data", data: "{10, 20, 30, 40, 50}")
  end

end
