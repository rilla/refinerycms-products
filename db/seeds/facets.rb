if defined?(User)
  User.all.each do |user|
    if user.plugins.where(:name => 'facets').blank?
      user.plugins.create(:name => 'facets',
                          :position => (user.plugins.maximum(:position) || -1) +1)
    end
  end
end