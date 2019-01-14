require 'securerandom'

module Jekyll
  class Likert < Liquid::Block
    alias_method :render_block, :render

    def initialize(tag_name, markup, tokens)
      @markup = markup
      super
    end

    # Uses the default Jekyll markdown parser to
    # parse the contents of this block
    #
    def render(context)
      _output = ""
      text = super
      site = context.registers[:site]
      converter = site.find_converter_instance(::Jekyll::Converters::Markdown)

      # Render any liquid variables
      markup = Liquid::Template.parse(@markup).render(context)

      # Extract tag attributes
      attributes = {}
      markup.scan(Liquid::TagAttributes) do |key, value|
        attributes[key] = value
      end

      @name = attributes["name"].gsub!(/\A"|"\Z/, '')

      _output += "<div class='question likert-question'>"

      @likerts = ""
      i = 0
      @nLikert = 0
      text.lines.each do |line|
        # if the line starts with [] or [.] or [ ] this must be turned into a radiobutton
        # we then get the id, which is the part after [] in ()
        if line =~ /^[\[X|\]]/
          @nLikert += 1
          # if @nLikert == 1
          #   _output += '<div class=\'likert\'>'
          # end
          id = line[/[\(](.*)[\)]/,1]
          @likerts += '<label class="likert_item" for="' + @name + "_"  + id + '">'
          @likerts += "<input type='radio' id='" + @name + "_" + id + "' "

          unless @name.nil?
            @likerts += "name='" + @name + "' "
          end

          if line[1] == "X"
            @likerts += "checked"
          end

          @likerts += "><br><span>"
          # _output += "<label>" + line + "</label>"

          @likerts += converter.convert(line[/[\)](.*)/,1]).gsub(/<\/?p[^>]*>/, "")
          @likerts += "</span></label>"
        else
          _output += converter.convert(line)
        end
        i += 1
      end

      _output += "<div class='likert'>" + @likerts + "</div>"

      # _output += "</div><style>." + @guid + " { width:" + (100 / @nLikert).to_s + "%;}</style>"

      _output + "</div>"
    end
  end
end

Liquid::Template.register_tag('likert', Jekyll::Likert)
