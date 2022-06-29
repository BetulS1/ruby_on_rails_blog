# data modeli ve özellikleri burada yer alıyor
class CreateData < ActiveRecord::Migration[7.0]
  def change
    create_table :data do |t|
      t.string :ad
      t.string :marka
      t.string :yorum

      t.timestamps
    end
  end
end
