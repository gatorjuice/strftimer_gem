class Translator

  def initialize(query)
    @query = query
  end

  def translation
    @_translation ||= build_translation
  end

  def valid?
    !query.nil? && !query.empty? && query != translation
  end

  def help_message
    HelpMessage.new(translation).message
  end

  private

  attr_reader :query

  def build_translation
    str = query
    str = IsoTranslator.new(str).translation
    str = TimeTranslator.new(str).translation
    str = DateTranslator.new(str).translation
    str
  end
end
