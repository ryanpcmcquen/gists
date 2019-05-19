def maxProfit(prices):
    minPrice = 9223372036854775807
    maxProfit = 0
    maxPrice = 0
    for price in prices:
        if price < minPrice:
            minPrice = price
        elif price > maxPrice:
            maxPrice = price
    maxProfit = maxPrice - minPrice
    return maxProfit if maxProfit > 0 else 0