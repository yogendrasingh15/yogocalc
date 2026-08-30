class Nominee < ApplicationRecord
  NOMINEE_FOR_OPTIONS = %w[banks insurance ppf investments provident_fund_retirement post_office demat_accounts property_assets].freeze

  belongs_to :user, optional: true

  validates :nominee_for, inclusion: { in: NOMINEE_FOR_OPTIONS }, allow_blank: true
  validates :user, presence: true

  def self.option_label(option)
    {
      "banks" => "Banks",
      "insurance" => "Insurance",
      "ppf" => "PPF",
      "investments" => "Investments",
      "provident_fund_retirement" => "Provident Fund & Retirement",
      "post_office" => "Post Office / Government Savings",
      "demat_accounts" => "Demat Accounts",
      "property_assets" => "Property & Other Assets",
    }[option]
  end
end
