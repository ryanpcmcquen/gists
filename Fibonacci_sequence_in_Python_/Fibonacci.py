'''
Return a Fibonacci sequence.
'''


def fibonacci(limit, sequence=None):
    '''
    Return Fibonacci sequence to limit using optional starting sequence.
    '''
    if sequence is None:
        sequence = [1, 1]

    sequence.append(sequence[-1] + sequence[-2])
    return fibonacci(limit - 1) if (limit >= len(sequence)) else sequence

print(
    fibonacci(10)
)
# => [1, 1, 2, 3, 5, 8, 13]
