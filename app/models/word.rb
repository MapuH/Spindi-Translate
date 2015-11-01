class Word < ActiveRecord::Base

  before_validation(on: :create) do
    self.spindi = UnicodeUtils.downcase(self.spindi) if attribute_present?("spindi")
    self.bg = UnicodeUtils.downcase(self.bg) if attribute_present?("bg")
  end

  validates :spindi, :bg, presence: { message: "Полето е задължително!" }
  validates :spindi, uniqueness: { message: "Думата вече съществува в речника!" }
  validates :spindi, :bg, format: { with: /\A[а-яА-Я0-9\-]+\z/, message: "Въведена е повече от една дума или думата не е изписана на кирилица!"}
  validates :spindi, :bg, length: { in: 2..30, too_short: "Трябва да съдържа поне 2 букви!", too_long: "Максимална дължина 30 букви!" }

end
