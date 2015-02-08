class User < ActiveRecord::Base
  has_and_belongs_to_many :teams, :join_table => "users_teams",
                                  :class_name => "Team"

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def self.search(query)
    where("email like ?", "%#{query}%")
  end
end
