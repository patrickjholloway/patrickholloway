class User
  include Mongoid::Document
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ## Database authenticatable
  field :email,              :type => String, :default => ""
  field :encrypted_password, :type => String, :default => ""

  validates_presence_of :email
  validates_presence_of :encrypted_password
  
  ## Recoverable
  field :reset_password_token,   :type => String
  field :reset_password_sent_at, :type => Time

  ## Rememberable
  field :remember_created_at, :type => Time

  ## Trackable
  field :sign_in_count,      :type => Integer, :default => 0
  field :current_sign_in_at, :type => Time
  field :last_sign_in_at,    :type => Time
  field :current_sign_in_ip, :type => String
  field :last_sign_in_ip,    :type => String
  field :username
  
  validates :username,      :presence => true,
                            :uniqueness => true,
                            :length => {:within => 6..20},
                            :format => { :with => /\A[A-Za-z0-9]+\z/,
                                :message => "can only contain letters and numbers." }

  has_and_belongs_to_many :styles
  has_and_belongs_to_many :fonts
  
  field :font_ids, :type => Array, :default => ["50c62fb3dbc5544faf000032", "50c62fb3dbc5544faf000098", "50c62fb3dbc5544faf0000af", "50c62fb3dbc5544faf0000f6"]
  
end
