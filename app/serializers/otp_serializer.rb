class OtpSerializer < ActiveModel::Serializer
  belongs_to :user, optional: true

  attributes :id, :mobile_number, :otp, :user_id, :verified
end
