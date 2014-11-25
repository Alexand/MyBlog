module ApplicationHelper
	class HTMLwithPygments < Redcarpet::Render::HTML
    def block_code(code, language)
      sha = Digest::SHA1.hexdigest(code)
      Rails.cache.fetch ["code", language, sha].join('-') do
        Pygments.highlight(code, lexer: language)
      end
    end
  end

  def markdown(text)
    renderer = HTMLwithPygments.new(hard_wrap: true, filter_html: true)
    options = {
      autolink: true,
      no_intra_emphasis: true,
      fenced_code_blocks: true,
      lax_spacing: true,
      strikethrough: true,
      superscript: true,
      highlight: true,
      filter_html: false,
      escape_html: false
    }
    Redcarpet::Markdown.new(renderer, options).render(text).html_safe
  end

  def kramdown(text)
    Kramdown::Document.new(text).to_html.html_safe
  end

	def getTags
  	@tags = Tag.all
  end
end
