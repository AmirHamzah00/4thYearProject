# Prepared By Curie Navita

from random import choice, randint

def generate_dataset(dataset_type, num_samples):
    dataset = []
    data_range = [-2, -1, 1, 2]
    min_value = min(data_range)
    max_value = max(data_range)
    
    if dataset_type == 'xor':
        for _ in range(num_samples):
            x = (choice(data_range) - min_value)/(max_value - min_value)
            y = (choice(data_range) - min_value)/(max_value - min_value)
            label = 1 if ((0.5<x and 0.5<y) or (0.5>x and 0.5>y)) else 0
            dataset.append([x, y, label])
            
    elif dataset_type == 'xor_basic':
        for _ in range(num_samples):
            x = randint(0, 1)
            y = randint(0, 1)
            label = 1 if ((0.5<x and 0.5<y) or (0.5>x and 0.5>y)) else 0
            dataset.append([x, y, label])

    return dataset, min_value, max_value