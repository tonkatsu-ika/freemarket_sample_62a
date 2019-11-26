class RomoveCullumnToCredit < ActiveRecord::Migration[5.2]
  def change
    remove_column :credit_cards, :number, :integer
    remove_column :credit_cards, :expiration_month, :date
    remove_column :credit_cards, :expiration_year, :date
    remove_column :credit_cards, :security_code, :integer
    remove_column :credit_cards, :main_card_flag, :boolean
  end
end
