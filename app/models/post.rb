class Post < ActiveRecord::Base
  validate :validate_title
  validates :title, presence: true
  validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
  validate :post_at_least_250
  validate :summary_is_up_to_250

  def post_at_least_250
  	if content.length < 250
  	  errors.add(:content, "Content must be at least 250 characters long.")
  	end
  end

  def summary_is_up_to_250
  	if summary.length > 250
  	  errors.add(:summary, "Your summary is greater than 250 characters.")
  	end
  end

  def validate_title
  	if title != nil 
	  	if title.include?("Won't Believe")
	  	  true
	  	elsif title.include?("Secret")
	  	  true
	  	elsif title.include?("Top")
	  	  true
	  	elsif title.include?("Guess")
	  	  true
	  	else errors.add(:summary, "Your title does not include clickbait!")
	  	end
	  end
  end
end
