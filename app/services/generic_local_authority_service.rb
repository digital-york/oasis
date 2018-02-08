module GenericLocalAuthorityService
  mattr_accessor :authority

  def self.select_all_options(key)
    self.authority = Qa::Authorities::Local.subauthority_for(key)

    authority.all.map do |element|
      [element[:label], element[:id]]
    end
  end

  def self.label(id)
    authority.find(id).fetch('term')
  end

end