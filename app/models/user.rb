class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook, :twitter, :google]
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end

  #Associations
  has_many :Notification, foreign_key: :recipient_id
  has_many :article, dependent: :destroy
  has_many :comment, dependent: :destroy
  has_many :diary, dependent: :destroy
  has_many :forum, dependent: :destroy
  has_many :membership
  has_many :groups, through: :membership
  belongs_to :role
  has_many :group
  has_many :group_post, dependent: :destroy

  #twitter like follows for the user
  has_many :follower_relationships, foreign_key: :following_id, class_name: 'Follow'
  has_many :followers, through: :follower_relationships, source: :follower

  has_many :following_relationships, foreign_key: :follower_id, class_name: 'Follow'
  has_many :following, through: :following_relationships, source: :following

  #custom methods for following an unfollowing users
  #something like current_user.follow user_id and current_user.unfollow user_id
  def follow(user_id)  
    following_relationships.create(following_id: user_id)
  end

  def unfollow(user_id)
    following_relationships.find_by(following_id: user_id).destroy
  end

  #set up the user avatar
  has_attached_file :avatar, styles: { medium: "400x400", small:"200x200", thumb:"100x100" }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/


  #default roles
  validates_presence_of :name
  before_save :assign_role

  def assign_role
    self.role = Role.find_by name: "regular" if self.role.nil?
  end
  def has_role?(role_sym)
    Role.any? { |r| r.name.underscore.to_sym == role_sym }
  end

  def admin?
    self.role == Role.find_by(name: 'admin')
  end
  def staff?
    self.role == Role.find_by(name: 'staff')
  end
  def regular?
    self.role = Role.find_by(name: 'regular')
  end
  
end
