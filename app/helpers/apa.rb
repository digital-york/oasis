class Apa
  def self.get_surname(name)
    if name.include? ','
      name.split(',')[0].strip
    else
      name.strip
    end
  end

  def self.get_initial(name)
    if name.include? ','
      name.split(',')[1].strip[0, 1].upcase + '.'
    else
      ''
    end
  end

  def self.format_name(name)
    get_surname(name) + ', ' + get_initial(name)
  end

  # author_all can be passed as an Array, or a string containing all authors, e.g. ["Author1","Author2","Author3",]
  def self.get_apa_short_author_all_in_one(author_all, publication_year)
    authors = author_all
    authors = author_all.strip.split('"').delete_if { |a| (a == '[') || a == ']' || (a == ',') } if authors.is_a? String
    authors_s = ''

    return authors[0] + ' (' + publication_year + ')' if authors.length == 1

    authors.each_with_index do |author, index|
      authors_s = authors_s + author + ', ' if index < authors.length - 1
      authors_s = authors_s + '& ' + author if index == authors.length - 1
    end

    authors_s + ' (' + publication_year + ')'
  end

  def self.get_apa_short_html(authors, publication_year)
    return '' if authors.nil? || publication_year.nil?

    if authors.length == 1
      get_surname(authors[0]) + ' (' + publication_year + ')'
    elsif authors.length == 2
      get_surname(authors[0]) + ' & ' + get_surname(authors[1]) + ' (' + publication_year + ')'
    elsif authors.length > 2
      get_surname(authors[0]) + ' et al. (' + publication_year + ')'
    else
      ''
    end
  end

  def self.get_doi_string(doi)
    return '' if doi.nil? || (doi == '')

    ' doi: ' + doi
  end

  def self.get_reference_html(authors, publication_year, title, journal, authority_value = true, volume, issue, page_from, page_to, doi)
    j_string = html_italic(journal) + '. '
    j_string = html_italic(get_journal_string(journal)) if authority_value == true
    get_author_string(authors) +
      get_publication_year_string(publication_year) +
      get_title_string(title) +
      j_string +
      get_vol_issue_string_html(volume, issue) +
      get_pages_string(page_from, page_to) +
      get_doi_string(doi)
  end

  def self.get_reference(authors, publication_year, title, journal, authority_value = true, volume, issue, page_from, page_to, doi)
    j_string = journal + '. '
    j_string = get_journal_string_markup(journal) if authority_value == true
    get_author_string(authors) +
      get_publication_year_string(publication_year) +
      get_title_string(title) +
      j_string +
      get_vol_issue_string(volume, issue) +
      get_pages_string(page_from, page_to) +
      get_doi_string(doi)
  end

  def self.get_other_journal_string(other_journal_name, other_journal_url)
    if !other_journal_name.nil? && (other_journal_name != '')
      return get_html_link(other_journal_url, other_journal_name) + ', '
    end

    ''
  end

  def self.get_reference_with_other_journal_name_html(authors, publication_year, title, other_journal_name, other_journal_url, authority_value = true, volume, issue, page_from, page_to, doi)
    j_string = html_italic(other_journal_name) + '. '
    j_string = html_italic(get_other_journal_string(other_journal_name, other_journal_url)) if authority_value == true
    get_author_string(authors) +
      get_publication_year_string(publication_year) +
      get_title_string(title) +
      j_string +
      get_vol_issue_string_html(volume, issue) +
      get_pages_string(page_from, page_to) +
      get_doi_string(doi)
  end

  def self.get_other_journal_string_markup(other_journal_name, other_journal_url)
    if !other_journal_name.nil? && (other_journal_name != '')
      if !other_journal_url.nil? && (other_journal_url != '')
        '[' + other_journal_name + '](' + other_journal_url + '), '
      else
        '[' + other_journal_name + '], '
      end
    end
  end

  def self.get_reference_with_other_journal_name(authors, publication_year, title, other_journal_name, other_journal_url, authority_value = true, volume, issue, page_from, page_to, doi)
    j_string = other_journal_name + '. '
    j_string = get_other_journal_string_markup(other_journal_name, other_journal_url) if authority_value == true
    get_author_string(authors) +
      get_publication_year_string(publication_year) +
      get_title_string(title) +
      j_string +
      get_vol_issue_string(volume, issue) +
      get_pages_string(page_from, page_to) +
      get_doi_string(doi)
  end

  def self.html_italic(s)
    if s.is_a? String
      '<i>' + s + '</i>'
    else
      '<i>' + s[0] + '</i>'
    end
  end

  def self.get_author_string(authors)
    # if gets a string, e.g. author_all, just return it directly, as a temporary solution for: https://github.com/digital-york/oasis/issues/29
    if authors.is_a? String
      authors + ' '
    elsif authors.length == 1
      authors[0] + ' '
    elsif authors.length == 2
      authors[0] + ' & ' + authors[1] + ' '
    elsif authors.length == 3
      authors[0] + ', ' + authors[1] + ' & ' + authors[2] + ' '
    else
      authors[0] + ' et al. '
    end
  end

  def self.get_publication_year_string(year)
    return '(' + year + '). ' if !year.nil? && (year != '')

    ''
  end

  def self.get_title_string(title)
    unless title.nil?
      if title.end_with? '.'
        return title + ' '
      else
        return title + '. '
      end
    end
    ''
  end

  def self.get_html_link(url, text, target = '_blank')
    '<a href="' + url + '" target="' + target + '">' + text + '</a>'
  end

  def self.get_journal_string(journal)
    unless journal.nil?
      if journal.starts_with?('http') || (journal.to_i <= 0)
        return get_html_link(journal, GenericLocalAuthorityService.id_to_label('journals', journal)) + ', '
      else
        return get_html_link(journal, GenericLocalAuthorityService.id_to_label('journals', journal.to_i)) + ', '
      end
    end
    ''
  end

  def self.get_journal_string_markup(journal)
    unless journal.nil?
      if journal.starts_with?('http') || (journal.to_i <= 0)
        return '[' + GenericLocalAuthorityService.id_to_label('journals', journal) + '](' + journal + '), '
      else
        return '[' + GenericLocalAuthorityService.id_to_label('journals', journal.to_i) + '](' + journal + '), '
      end
    end
    ''
  end

  def self.get_vol_issue_string_html(vol, issue)
    return html_italic(vol) + '(' + issue + ')' + ', ' unless vol.nil? || issue.nil?

    ''
  end

  def self.get_vol_issue_string(vol, issue)
    return vol + '(' + issue + ')' + ', ' unless vol.nil? || issue.nil?

    ''
  end

  def self.get_pages_string(page_from, page_to)
    return page_from + '-' + page_to + '.' if !page_from.nil? && (page_from != '') && !page_to.nil? && (page_to != '')

    ''
  end
end
