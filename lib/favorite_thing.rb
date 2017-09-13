class Items
  @@list =[]
  attr_reader :id
  attr_accessor :name, :description, :ranking

  def initialize (name, description, ranking)
    @name = name
    @description =description
    @ranking = ranking
    @id = @@list.length + 1
  end

  def self.find(id)
    @@list[id-1]
  end

  def save
    @@list.push(self)
    binding.pry
  end

  def self.clear
    @@list =[]
  end

  def self.all
    @@list
  end

  def self.isExist(name , rank)
    result = {'name' => false , 'rank' => false}
    if @@list.length > 0
      @@list.each do |list_obj|
        if list_obj.name == name
          result['name'] = true
        end
        if list_obj.ranking == rank
          result['rank'] = true
        end
      end
    end
    result
  end

  def self.update_name(new_name, id)
    if @@list[id-1]
      @@list[id-1].name = new_name
    end
  end

  def self.delete(id)
    if @@list[id-1]
      @@list.delete_at(id-1)
    end
  end

end
