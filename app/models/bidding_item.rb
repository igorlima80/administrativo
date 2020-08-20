class BiddingItem < ApplicationRecord
  belongs_to :bidding
  belongs_to :product, optional: true
  belongs_to :task, optional: true
end
