if defined?(User)
  User.all.each do |user|
    if user.plugins.where(:name => 'corporate_pages').blank?
      user.plugins.create(:name => 'corporate_pages',
                          :position => (user.plugins.maximum(:position) || -1) +1)
    end
  end
end