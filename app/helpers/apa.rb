class Apa
  def self.get_reference_html(authors, publication_year, title, journal, volume, issue, page_from, page_to)
    get_author_string(authors) +
        get_publication_year_string(publication_year) +
        get_title_string(title) +
        html_italic(get_journal_string(journal))+
        get_vol_issue_string(volume, issue) +
        get_pages_string(page_from,page_to)
  end

  def self.html_italic(string)
    '<i>' + string + '</i>'
  end

  def self.get_author_string(authors)
    if authors.length==1
      return authors[0] + ' '
    else
      l = ''
      authors.each do |author, index|
        if index<authors.length-1
          l = l + author + ', '
        else
          l = l + '& ' + author + ' '
        end
      end
      return l
    end
  end

  def self.get_publication_year_string(year)
    if not year.nil? and not year[0].nil? and year[0]!=''
      return '(' + year[0] + '). '
    end
    ''
  end

  def self.get_title_string(title)
    if not title.nil? and not title[0].nil? and title[0]!=''
      if title[0].end_with? '.'
        return title[0] + ' '
      else
        return title[0] + '. '
      end
    end
    ''
  end

  def self.get_journal_string(journal)
    if not journal.nil? and not journal[0].nil? and journal[0]!=''
      return GenericLocalAuthorityService.id_to_label('journals',journal[0].to_i) + '. '
      #return journal[0] + '. '
    end
    ''
  end

  def self.get_vol_issue_string(vol,issue)
    if not vol.nil? and not vol[0].nil? and vol[0]!='' and not issue.nil? and not issue[0].nil? and issue[0]!=''
      return html_italic(vol[0]) + '('+issue[0]+')'+', '
    end
    ''
  end

  def self.get_pages_string(page_from,page_to)
    if not page_from.nil? and not page_from[0].nil? and page_from[0]!='' and not page_to.nil? and not page_to[0].nil? and page_to[0]!=''
      return page_from[0] + '('+page_to[0]+')'+'.'
    end
    ''
  end
end