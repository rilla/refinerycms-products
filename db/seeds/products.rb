if defined?(User)
  User.all.each do |user|
    if user.plugins.where(:name => 'products').blank?
      user.plugins.create(:name => 'products',
                          :position => (user.plugins.maximum(:position) || -1) +1)
    end
  end
end