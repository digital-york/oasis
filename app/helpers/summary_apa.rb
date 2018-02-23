class SummaryApa < Apa
  def self.get_summary_reference_html(authors, publication_year, title, oasis_publication_name)
    get_author_string(authors) +
        get_summary_year_string(publication_year) +
        get_title_string(title) +
        html_italic(oasis_publication_name) + '.'
  end

  def self.get_summary_year_string(year)
    if not year.nil? and year!=''
      return '(' + year + '). '
    end
    ''
  end
end