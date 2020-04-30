class CreateData < ActiveRecord::Migration[6.0]
  def change
    create_table :data do |t|
      t.datetime :Date
      t.integer :Cases
      t.float :Gompertz, :New_Cases, :Italy_Trajectory, :Germany_Trajectory, :Spain_Trajectory

      t.timestamps
    end
  end
end
