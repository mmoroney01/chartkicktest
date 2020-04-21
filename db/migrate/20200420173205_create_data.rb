class CreateData < ActiveRecord::Migration[6.0]
  def change
    create_table :data do |t|
      t.datetime :Date
      t.integer :US_Actual
      t.float :Unchecked, :Italy_Trajectory, :Hubei_China_Trajectory, :South_Korea_Trajectory

      t.timestamps
    end
  end
end
