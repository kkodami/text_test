purchases = [
    {"item": "apple", "category": "fruit", "price": 1.2, "quantity": 10},
    {"item": "banana", "category": "fruit", "price": 0.5, "quantity": 5},
    {"item": "milk", "category": "dairy", "price": 1.5, "quantity": 2},
    {"item": "bread", "category": "bakery", "price": 2.0, "quantity": 3},
]


def total_revenue(purchases):
    return sum(p["price"] * p["quantity"] for p in purchases)


def items_by_category(purchases):
    result = {}
    for p in purchases:
        category = p["category"]
        item = p["item"]
        if category not in result:
            result[category] = []
        if item not in result[category]:
            result[category].append(item)
    return result


def expensive_purchases(purchases, min_price):
    return [p for p in purchases if p["price"] >= min_price]


def average_price_by_category(purchases):
    totals = {}
    counts = {}
    for p in purchases:
        category = p["category"]
        totals[category] = totals.get(category, 0) + p["price"]
        counts[category] = counts.get(category, 0) + 1
    return {cat: round(totals[cat] / counts[cat], 2) for cat in totals}


def most_frequent_category(purchases):
    quantities = {}
    for p in purchases:
        category = p["category"]
        quantities[category] = quantities.get(category, 0) + p["quantity"]
    return max(quantities, key=quantities.get)


print(f"Общая выручка: {total_revenue(purchases)}")
print(f"Товары по категориям: {items_by_category(purchases)}")
print(f"Покупки дороже 1.0: {expensive_purchases(purchases, 1.0)}")
print(f"Средняя цена по категориям: {average_price_by_category(purchases)}")
print(f"Категория с наибольшим количеством проданных товаров: {most_frequent_category(purchases)}")
