class LRUCache
    attr_reader :size, :cache

    def initialize(size)
      @size = size
      @cache = []
    end

    def count
      self.cache.length
    end

    def add(el)
      if self.cache.include?(el)
        self.cache.delete(el)
        self.cache.unshift(el)
      elsif self.count >= self.size
        self.cache.pop
        self.cache.unshift(el)
      else
        self.cache.unshift(el)
      end
    end

    def show
      print self.cache
    end

    private


  end
