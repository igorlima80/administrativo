class Account < ApplicationRecord
  belongs_to :bank
  belongs_to :bank_account_type
end
