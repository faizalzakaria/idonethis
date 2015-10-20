class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :tasks, dependent: :destroy

  validates :username,
            exclusion: { in: %w(admin superuser) },
            presence: true,
            format: { :without => /\s/ },
            uniqueness: true

end
