module Jekyll
  class TextInput < Liquid::Block
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
      @type = attributes["type"]

      if @type.nil?
        @type = "text"
      else
        @type = @type.gsub!(/\A"|"\Z/, '')
      end

      _output += "<div class='question'>"

      # i = 0
      text.lines.each do |line|
        # if the line starts with [ or [.] or [ ] this must be turned into a text-field
        # we then get the id, which is the part after [] in ()
        if line =~ /^[\[]/
          hint = id = line[/^[\[](.*)[\]]/,1]
          id = line[/[\(](.*)[\)]/,1]
          _output += "<div>"
          _output += '<label for="' + @name + '_' + id + '">'

          if @type == "textarea"
            _output += '<textarea '
          else
            _output += '<input type="text" '
          end

          _output += 'id="' + @name + '_' + id + '" '

          unless @name.nil?
            _output += "name='" + @name + "' "
          end

          unless hint.nil?
            _output += "placeholder='" + hint + "' "
          end

          _output += ">"
          if @type == "textarea"
            _output += '</textarea>'
          end

          _output += converter.convert(line[/[\)](.*)/,1]).gsub(/<\/?p[^>]*>/, "")
          _output += "</label></div>"
        else
          _output += converter.convert(line)
        end
      end

      _output + "</div>"
    end
  end
end

Liquid::Template.register_tag('text_input', Jekyll::TextInput)
