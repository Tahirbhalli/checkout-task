SALES_TAX = 10

class Terminal
  attr_reader :total, :checkout_code, :b_occernce
  def initialize(checkout_code)
    @checkout_code = checkout_code
    @total = 0.0
    @b_occernce = checkout_code.count("B")
  end

  def scan(product_code)
    Product.find_by(product_code: product_code)
  end

  def total
    uniq_codes = @checkout_code.uniq
    uniq_codes.each do |code|
      @total += calculate(scan(code), @checkout_code.count(code))
    end
    add_tax
    @total.round(2)
  end

  private

  def calculate(product, count)
    if product.product_code == "E" && @b_occernce != 0
      @b_occernce -= 1
      return 0.0
    end
    return count * product.unit_price if product.bundle_size.zero?
    (count/product.bundle_size) * product.bundle_price + (count%product.bundle_size) * product.unit_price
  end

  def add_tax
    @total += (@total/100) * SALES_TAX
  end
end