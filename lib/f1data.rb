require 'json'

class F1Data
  attr_accessor :drivers, :constructors

  def initialize()
    file = File.read('data/data.json')
    data_hash = JSON.parse(file)

    @drivers = data_hash['Drivers']
    @constructors = data_hash['Constructors']
  end

  def get_driver(driver_name)
    @drivers["#{driver_name.downcase}"]
  end

  def get_constructor(constructor)
    @constructors["#{constructor.downcase}"]
  end

  def get_num_constructors
    @constructors.length
  end

  def get_all_constructors
    @constructors
  end

end