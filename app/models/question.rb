class Question < ApplicationRecord
  has_many :answers, dependent: :destroy # Questionが削除されたら、それに紐づくAnswerも削除される

  validates :title, presence: true # titleが空の場合はDBへ保存しない
  validates :name, presence: true # nameが空の場合はDBへ保存しない
  validates :content, presence: true, length: { minimum: 5 } # contentが空、または5文字未満の場合はDBへ保存しない
end
