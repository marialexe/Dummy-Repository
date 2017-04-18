# function1 ===> test no.1
  def pet_shop_name(petshop) 
    return petshop[:name]
  end

# function2 ===> test no.2
  def total_cash(petshop)
    return petshop[:admin][:total_cash]
  end

# function3 ===> tests no.3 & 4. 
  def add_or_remove_cash(petshop,cash) 
    petshop[:admin][:total_cash] += cash
  end

# function5 ===> test no.5
  def pets_sold(petshop)
    return petshop[:admin][:pets_sold]
  end

# function6 ===> test no.6
  def increase_pets_sold(petshop,sold)
    petshop[:admin][:pets_sold]+=sold
  end

# function7 ===> test no.7
  def stock_count(petshop)
    return petshop[:pets].size()
  end                 

# function8 ===> test no.8 & 9
    # using ".each"
  def pets_by_breed(petshop,breed)
    pets=[]
    petshop[:pets].each do
      |pet| 
      if pet[:breed] == breed
          pets.push(breed) 
      end
    end
    return pets
  end

# function9 ===> no.8 & 9
    # using "for loop"
  def pets_by_breed(petshop,breed)
    pets=[]
    for pet in petshop[:pets] do
      if pet[:breed] == breed
          pets.push(breed) 
      end
    end
    return pets
  end

# function10 ===> test no.10 & 11
    # using ".each"
  def find_pet_by_name(petshop,pet_name)
    petshop[:pets].each do 
      if pet_hash[:name] == pet_name
        return pet_hash
      end
    end
    return nil
  end

# function11 answering to test no.10 and 11
    # using ".each"
  def find_pet_by_name(petshop,pet_name)
      for pet_hash in petshop[:pets] do 
        if pet_hash[:name] == pet_name
          return pet_hash
        end
      end
    return nil
  end

  # return nil outside the for loop, to avoid the NoMethodError: undefined method `[]' for nil:NilClass error message

# ...functions 10 and 11 attempts...

  # attempt1
    # def find_pet_by_name(petshop,pet_name)
    #   pets={}
    #   petshop[:pets].each do
    #     if pet[:name] == pet_name
    #       pets[:name]=pet_name
    #     end
    #   end
    #   pets[:name] == pet_name ? pets : nil
    # end

  # attempt2 
    # def find_pet_by_name(petshop,pet_name)
    #   pets={}
    #     for pet in petshop[:pets] do
    #       if pet[:name] == pet_name
    #         pets[:name]=pet_name
    #       end
    #     end
    #     pets[:name] == pet_name ? pets : nil
    #   end

  # attempt3 
    # def find_pet_by_name(petshop,pet_name)
    #   pets=Array.new(stock_count(petshop),Hash.new)
    #   index=0
    #     for pet in petshop[:pets] do
    #         pets[index][:name]=pet[:name]
    #         index+=1
    #     end
    #     for index in (0..stock_count(petshop)) do
    #     pets[index][:name] == pet_name ? pets : nil
    #     end
    # end

  # attempt4 
    # def find_pet_by_name(petshop,pet_name)
    #   pets={}
    #     for pet in petshop[:pets] do
    #       if pet[:name] == pet_name
    #         pets[:name]=pet_name
    #       end
    #     end
    #     pets[:name] == pet_name ? pets : nil
    #   end

  # attempt5 
    # def find_pet_by_name(petshop,pet_name)
    #   output_hash={}
    #     for pet_hash in petshop[:pets] do 
    #       if pet_hash.values_at(:name) == pet_name
    #         output_hash[:name] = pet_hash.values_at(:name)
    #       end
    #       return output_hash
    #     end
    #   end

# function12 ===> test no.12
  def remove_pet_by_name(petshop,pet_name)
    for pet_hash in petshop[:pets] do
      petshop[:pets].delete_if do |hash| hash[:name]==pet_name
      end
    end
    return petshop[:pets]
  end

# function13 ===> test no.13
  def add_pet_to_stock(petshop,new_pet)
    petshop[:pets].push(new_pet)
    return petshop
  end

# function14 ===> test no.14
  def customer_pet_count(customer)
    return customer[:pets].count()
    # return customer[:pets].length()
    # return customer[:pets].size()
  end

# ...functions 14 attempts...

  # attempt1 
    # def customer_pet_count(customers)
    #   string=""
    #   for customer in customers do
    #     string+=customers[:pets].to_s
    #   end
    #   return string.to_i
    # end

  # attempt2
    # def customer_pet_count(customers)
    #     string_value=customers[:pets].to_s
    #   return string_value.to_i
    # end

  # attempt3
    # def customer_pet_count(customers)
    #   for customer in customers do
    #    return customers[:pets].to_s.to_i
    #   end
    # end

# function15 ===> test no.15
  def add_pet_to_customer(customer,new_pet)
    customer[:pets].push(new_pet[:pet_type])
    return customer[:pets].count()
  end

#OPTIONAL

#function16 ===> test no.16 & 17
  def customer_can_afford_pet(customer,new_pet)
    customer[:cash] >= new_pet[:price] ?
        true : false
  end

#function17 ===> test no.16 & 17
  def customer_can_afford_pet(customer,new_pet)
    customer_cash=customer[:cash]
    @pet_shop[:pets].push(new_pet)
    for pet in @pet_shop[:pets] do
      if customer_cash >= pet[:price] 
        return true
      else
        return false
      end
    end
  end

# Integration tests

#function18 for test no.18-20
  def sell_pet_to_customer(petshop,pet,customer)

    if (customer[:cash] >= pet[:price]) #&& (petshop[:pets][:name] == pet[:name])
      customer[:pets].push(pet[:name])
    end
   # return customer[:pets].count()
  end


  # def sell_pet_to_customer(pet_shop,pet,customer)
  #   init_length=customer[:pets].count()
  #   if (pet_shop[:pets][:name] == pet[:name]) && (customer[:cash] >= pet_shop[:pets][:price])
  #     customer[:pets] << pet[:name]
  #   end
  #   customer[:pets].length > init_length ? true : false
  # end







