module Jekyll
  # Monkeypatch Layout class to provide
  # haml conversion for layout files
  class Layout
    alias old_initialize initialize

    def initialize(*args)
      old_initialize(*args)
      # self.transform
      self.content = transform
    end
  end
end
