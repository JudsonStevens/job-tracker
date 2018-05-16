module ApplicationHelper
  def svg_asset(asset, options = {})
    file = File.read(Rails.root.join('app', 'assets', 'images', "#{asset}.svg"), encoding: 'ISO-8859-1:utf-8')
    doc = Nokogiri::HTML::DocumentFragment.parse(file)
    svg = doc.at_css 'svg'
  
    if options[:class].present?
      svg['class'] = options[:class]
    end
  
    if options[:width].present?
      svg['width'] = options[:width]
    end
  
    if options[:height].present?
      svg['height'] = options[:height]
    end
  
    doc.to_html.html_safe
  end
end
