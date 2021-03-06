class Project < ApplicationRecord

  # 数据栏位校验
  validates :title, presence: true
  validates :description, presence: true

  # 与 user 关系
  belongs_to :user

  # 与 post 关系
  has_many :posts, dependent: :destroy

  # 工程状态
  STATUS = ["communication", "payment", "development", "text", "complete"]
  validates_inclusion_of :status, :in => STATUS

end
