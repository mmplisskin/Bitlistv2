class Item < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  # has_many :reports 
  # before_create :default_name

  # validates(:name, presence: true)
  # validates(:city, presence: true, length: { maximum: 25 })
  # validates(:state, presence: true)
  # validates_format_of :zipcode,
  #                 with: /\A\d{5}-\d{4}|\A\d{5}\z/,
  #                 message: "please enter a valid zip"
  # validates(:description, presence: true, uniqueness: true, length: { minimum: 2, maximum: 400 })
  # validates_numericality_of :price, :greater_than => 0, :less_than => 1000
  # validates(:phone_number, :numericality => true, length: { minimum: 10, maximum: 10 })




  has_attached_file :image, styles: { small: "100x100", med: "300x300", large: "500X500" }
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]



  # def default_name
  #   self.name ||= File.basename(image.filename, '.*').titleize if image
  # end


  geocoded_by :full_address
  after_validation :geocode

  def full_address
    [city, state, zipcode].join(', ')
  end

  def self.search(params)

    items = Item.where("name ILIKE ? OR description ILIKE ?", "%" + params[:search] + "%", "%" + params[:search] + "%") if params[:search].present?
    items = items.near(params[:location], 20) if params[:location].present? && params[:search].present?
    items

  end

end
