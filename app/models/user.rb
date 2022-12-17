# frozen_string_literal: true

class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User

  enum type_users: { "provider" => 0, "consumer" => 1 }

  has_one :restaurant, class_name: "Restaurant::Record"


  validates_presence_of :name, :lastname, :age, :email, presence: true

  def provider?
    type_user == 0 ? true : false
  end
  
  def consumer?
    !provider?
  end
end
