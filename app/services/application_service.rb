class ApplicationService
  def self.call(*opts)
    new(*opts).call
  end

  def initialize(*_); end

  def call
    raise NotImplementedError
  end
end
