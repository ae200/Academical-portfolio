class AddJobReferenceToPortfolios < ActiveRecord::Migration[5.1]
  def change
    add_reference :portfolios, :job, foreign_key: true
  end
end
