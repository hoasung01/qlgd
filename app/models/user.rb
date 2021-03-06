class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :cas_authenticatable, :trackable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :code, :ho_dem, :ten, :imageable_id, :imageable_type
  # attr_accessible :title, :body
  belongs_to :imageable, :dependent => :destroy, :polymorphic => true

  def cas_extra_attributes=(extra_attributes)
    if extra_attributes["status"] != 0 and extra_attributes["masinhvien"]
        code = extra_attributes["masinhvien"].upcase
        sv = SinhVien.where(:code => code).first
        if sv
          sv.user = self
          sv.save!
        end
        gv = GiangVien.where(:code => code).first
        if gv
          gv.user = self 
          gv.save!              
        end
    end    
  end
end
