class Post < ActiveRecord::Base
  validates :title, presence: true 
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: ["Fiction", "Non-Fiction"]}
  validate :click_baity


  def click_baity
    # if :title.to_s.include?("Won't Believe", "Secret", "Top ", "Guess")
    # case title
    # when title.to_s.include?("Won't Believe")
    #   errors.add(:title, "needa be clickbaity")
    # when title.to_s.include?("Secret")
    #   errors.add(:title, "needa be clickbaity")
    # when "True Facts"
    #   errors.add(:title, "needa be clickbaity")
    # when title.to_s.include?("Top ")
    #   errors.add(:title, "needa be clickbaity")
    # when title.to_s.include?("Guess")
    #   errors.add(:title, "needa be clickbaity")
    # end

    clickbait_headlines = [
    /Won't Believe/,
    /Secret/,
    /Top \d+/,
    /Guess/
  ]

    if clickbait_headlines.none? { |headline| headline.match title }
      errors.add(:title, "needa be a click-a-baita")
    end
  end 
  
end
