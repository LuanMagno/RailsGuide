module Person
  class Juridic
    def initialize(name,cnpj)
      @name = name
      @cnpj = cnpj
    end

    def add
      puts "Juridic person added"
      puts "Name #{@name}"
      puts "Cnpj #{@cnpj}"
    end
  end

  class Physical
    def initialize(name,cpf)
      @name = name
      @cpf = cpf
    end

    def add
      puts "Physical person added"
      puts "Name #{@name}"
      puts "cpf #{@cpf}"
    end
  end
end



Person::Juridic.new("Teste sla","1234567").add()
Person::Physical.new("TesteFisico","987654321").add()