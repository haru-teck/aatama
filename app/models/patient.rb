class Patient < ApplicationRecord
  belongs_to :user
  has_many :conditions

  validates :name, presence: true
  validates :birthday, presence: true  
  validates :gender, inclusion: { in: ['男性', '女性', 'その他'], allow_nil: true } 
  validates :furigana, presence: true, format: { 
    with: /\A[ァ-ヶー\s　]+\z/, 
    message: "は全角カタカナとスペースのみで入力してください" 
  }
  
  def age_with_months
    return unless birthday # 誕生日が設定されている場合のみ計算

    now = Time.zone.today
    age = now.year - birthday.year
    age -= 1 if now < birthday + age.years # 誕生日がまだ来ていない場合、1年引く
    months = (now.month - birthday.month) % 12 # 誕生月からの経過月数
    months += 12 if months < 0 # もし負数になったら12を加算
    [age, months] # 年齢と月を返す
  end
end
