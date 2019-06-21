class ContentBlock < ActiveRecord::Base
  # The keys in this registry are "public" names for collaborator
  # objects, and the values are reserved names of ContentBlock
  # instances, which Hyrax uses as identifiers. Values also correspond
  # to names of messages that can be sent to the ContentBlock class to
  # return defined ContentBlock instances.
  NAME_REGISTRY = {
    marketing: :marketing_text,
    researcher: :featured_researcher,
    announcement: :announcement_text,
    about: :about_page,
    help: :help_page,
    terms: :terms_page,
    agreement: :agreement_page,
    activities: :activities_page,
    people_saying: :people_saying_page,
    supporting_journals: :supporting_journals_page
  }.freeze

  # NOTE: method defined outside the metaclass wrapper below because
  # `for` is a reserved word in Ruby.
  def self.for(key)
    key = key.respond_to?(:to_sym) ? key.to_sym : key
    raise ArgumentError, "#{key} is not a ContentBlock name" unless whitelisted?(key)

    ContentBlock.public_send(NAME_REGISTRY[key])
  end

  class << self
    def whitelisted?(key)
      NAME_REGISTRY.include?(key)
    end

    def marketing_text
      find_or_create_by(name: 'marketing_text')
    end

    def marketing_text=(value)
      marketing_text.update(value: value)
    end

    def announcement_text
      find_or_create_by(name: 'announcement_text')
    end

    def announcement_text=(value)
      announcement_text.update(value: value)
    end

    def featured_researcher
      find_or_create_by(name: 'featured_researcher')
    end

    def featured_researcher=(value)
      featured_researcher.update(value: value)
    end

    def about_page
      find_or_create_by(name: 'about_page') ||
        create(name: 'about_page', value: default_oasis_about_text)
    end

    def about_page=(value)
      about_page.update(value: value)
    end

    def agreement_page
      find_by(name: 'agreement_page') ||
        create(name: 'agreement_page', value: default_agreement_text)
    end

    def agreement_page=(value)
      agreement_page.update(value: value)
    end

    def help_page
      find_or_create_by(name: 'help_page')
    end

    def help_page=(value)
      help_page.update(value: value)
    end

    def terms_page
      find_by(name: 'terms_page') ||
        create(name: 'terms_page', value: default_terms_text)
    end

    def terms_page=(value)
      terms_page.update(value: value)
    end

    def activities_page
      find_by(name: 'activities_page') ||
        create(name: 'activities_page', value: default_activities_text)
    end

    def activities_page=(value)
      activities_page.update(value: value)
    end

    def people_saying_page
      find_by(name: 'people_saying_page') ||
        create(name: 'people_saying_page', value: default_people_saying_text)
    end

    def people_saying_page=(value)
      people_saying_page.update(value: value)
    end

    def supporting_journals_page
      find_by(name: 'supporting_journals_page') ||
        create(name: 'supporting_journals_page', value: default_supporting_journals_text)
    end

    def supporting_journals_page=(value)
      supporting_journals_page.update(value: value)
    end

    def default_agreement_text
      ERB.new(
        IO.read(
          Hyrax::Engine.root.join('app', 'views', 'hyrax', 'content_blocks', 'templates', 'agreement.html.erb')
        )
      ).result
    end

    def default_terms_text
      ERB.new(
        IO.read(
          Hyrax::Engine.root.join('app', 'views', 'hyrax', 'content_blocks', 'templates', 'terms.html.erb')
        )
      ).result
    end

    def default_activities_text
      ERB.new(
        IO.read(
          Rails.root.join('app', 'views', 'hyrax', 'content_blocks', 'templates', 'activities.html.erb')
        )
      ).result
    end

    def default_people_saying_text
      ERB.new(
        IO.read(
          Rails.root.join('app', 'views', 'hyrax', 'content_blocks', 'templates', 'people_saying.html.erb')
        )
      ).result
    end

    def default_supporting_journals_text
      ERB.new(
        IO.read(
          Rails.root.join('app', 'views', 'hyrax', 'content_blocks', 'templates', 'supporting_journals.html.erb')
        )
      ).result
    end

    def default_oasis_about_text
      ERB.new(
        IO.read(
          Rails.root.join('app', 'views', 'hyrax', 'content_blocks', 'templates', 'aboutpage.html.erb')
        )
      ).result
    end
  end
end
