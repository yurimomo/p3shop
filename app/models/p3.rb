class P3 < ActiveRecord::Base
 belongs_to :user
 has_many :comments, dependent: :destroy
 mount_uploader :picture , PictureUploader

 def self.search(search) #self.でクラスメソッドとしている
    if search # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
      P3.where(['name LIKE ?', "%#{search}%"])
    else
      P3.all #全て表示。
    end
  end

end
