class Product
   
   attr_reader :title, :price, :barcode, :manufacturer, :code
   attr_writer :barcode, :code
   
   def initialize (prod_data)
      @title = self.title=(prod_data['title'])
      @price = self.price=(prod_data['price'])
      @barcode = prod_data['barcode']
      self.manufacturer=(prod_data['manufacturer_code'])
      @code = generate_control_code
   end
   
   def title= (new_title)
      if new_title == nil || new_title.empty?
         fail SimpleStore::Error, "O título do produto não pode ser vazio"
      else
         @title = new_title.to_s
      end
   end
   
   def price= (new_price)
      if new_price == nil || new_price <= 0.0
         fail SimpleStore::Error, "O preço do produto deve ser >= 0.0"
      else
         @price = new_price
      end
   end
   
   def manufacturer= (new_man_code)
      authorized = false
      SimpleStore::AUTHORIZED_MANUFACTURERS.keys.each do |man|
         if new_man_code == SimpleStore::AUTHORIZED_MANUFACTURERS[man]
            authorized = true
            break
         end
      end
      if !authorized
         fail SimpleStore::Error, "O fabricante não está autorizado"
      else
         @manufacturer = SimpleStore::AUTHORIZED_MANUFACTURERS.keys[new_man_code]
      end
   end
   
   private
   
   def generate_control_code
      type_code = 0
      man_code = SimpleStore::AUTHORIZED_MANUFACTURERS[@manufacturer]
      bar_code = @barcode
      "#{type_code}--#{man_code}--#{bar_code}"
   end
    
end