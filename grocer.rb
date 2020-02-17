def find_item_by_name_in_collection(name, collection)
  i = 0
  while i < collection.length do
    if name == collection[i][:item]
    return collection[i]
   end
   i+=1
 end
end

def consolidate_cart(cart)
new_cart = []
counter = 0
while counter < cart.length
  new_cart_item = find_item_by_name_in_collection(cart[counter][:item],new_cart)
  if new_cart_item != nil
    new_cart_item[:count]+=1
  else
    items =
    {:item => cart[counter][:item],
     :price => cart[counter][:price],
     :clearance => cart[counter][:clearance],
     :count => 1}
     new_cart << items
   end
   counter+=1
 end
 new_cart
end

def apply_coupons(cart, coupons)
counter = 0
while counter < coupons.length
  cart_item = find_item_by_name_in_collection(coupons[counter][:item],cart)
  cin = "#{coupons[counter][:item]} W/COUPON"
  ciwc = find_item_by_name_in_collection(cin,cart)
  if cart_item && cart_item[:count] >= coupons[counter][:num]
    if ciwc
      ciwc[:count] += coupons[counter][:num]
      cart_item[:count] -= coupons[counter][:num]
    else
      ciwc = {
        :item => cin,
        :price => coupons[counter][:cost] / coupons[counter][:num],
        :count => coupons[counter][:num],
        :clearance => cart_item[:clearance]
      }
      cart << ciwc
      cart_item[:count] -= coupons[counter][:num]
      end
    end
    counter+=1
  end
  cart
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
end
