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

  def self.id_to_label(key, id)
    authority = Qa::Authorities::Local.subauthority_for(key)
    term = ''
    begin
      term = authority.find(id).fetch('term')
    rescue
    end
    term
  end
end