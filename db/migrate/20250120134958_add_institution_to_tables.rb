class AddInstitutionToTables < ActiveRecord::Migration[6.1]
  def change
    add_reference :users, :institution, foreign_key: true
    add_reference :rooms, :institution, foreign_key: true, null: false
    add_reference :floors, :institution, foreign_key: true, null: false
    add_reference :buildings, :institution, foreign_key: true, null: false
    add_reference :reservations, :institution, foreign_key: true, null: false
  end
end
