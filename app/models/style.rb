class Style
  include Mongoid::Document
  has_and_belongs_to_many :user

  field :name, default: 'no name'
  field :h_font_family, default: 'Verdana'
  field :h_font_style, default: 'normal'
  field :h_font_size, default: '16pt'
  field :h_line_height, default: '1.5'
  field :h_text_transform, default: 'normal'
  field :sh_font_family, default: 'Verdana'
  field :sh_font_style, default: 'italic'
  field :sh_font_size, default: '12pt'
  field :sh_line_height, default: '1.1'
  field :sh_text_transform, default: 'normal'
  field :p_font_family, default: 'Verdana'
  field :p_font_style, default: 'normal'
  field :p_font_size, default: '12pt'
  field :p_line_height, default: '1pt'
  field :p_text_transform, default: 'normal'
  
  validates :name,    uniqueness: true,
                      presence: true
end
