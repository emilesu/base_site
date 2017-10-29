class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  # 与 project关系
  has_many :projects, dependent: :destroy

  # 与 post 关系
  has_many :posts, dependent: :destroy

  # email 用户名缩写
  def display_name
    self.email.split("@").first
  end

end
