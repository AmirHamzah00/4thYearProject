# Prepared by Amir Hamzah
import random
from SigmoidFunc import sigmoid
from math import log
# define exponent value
random.seed(100)
# create layer within the NNs
def create_layer(n_inputs, n_neurons):
    layer = [{'weights':[0.1*random.random() for i in range(n_inputs)], 'bias':0} for i in range(n_neurons)]
    return layer

# create the NNs based on the number of layers defined
def create_NN(structure):
    network = []
    for i in range(len(structure)-1):
        layer = create_layer(structure[i], structure[i+1])
        network.append(layer)
    print('This NN uses the ReLU and Sigmoid Activation Function')
    print('Initial Values in the Layers:')
    for layer in network:
        print(layer)
    print()
    return network

# this carries of the summation weights, inputs and bias before the transfer function
def activate(weights, bias, rows):
    inputs = rows
    activation = bias
    for i in range(len(weights)):
        activation += weights[i] * inputs [i]
    return activation

# this uses the ReLU transfer function
def ReLUTransfer_func(activation):
    activation = max(0, activation)
    return activation

# this uses the signmoid transfer function
def SigmoidTransfer_func(activation):
    return sigmoid(activation)

# this handles the forward propagation 
def forward_propagate(network, rows):
    inputs = rows
    for i in range(len(network)):
        layer = network[i]
        new_inputs = []
        if i != len(network)-1:
            for neuron in layer:
                activation = activate(neuron['weights'], neuron['bias'], inputs)
                neuron['output'] = ReLUTransfer_func(activation)
                new_inputs.append(neuron['output'])
        else:
            for neuron in layer:
                activation = activate(neuron['weights'], neuron['bias'], inputs)
                neuron['output'] = SigmoidTransfer_func(activation)
                new_inputs.append(neuron['output'])
                output = neuron['output']
        inputs = new_inputs
    return output

# transfer function derivative 
def ReLUTransfer_func_derivative(output):
    if output > 0:
        return 1
    else:
        return 0

# transfer function derivative 
def SigmoidTransfer_func_derivative(output):
    derivative = output * (1 - output)
    return derivative

# this part handles backpropagation
def back_propagate(network, expected):
    for i in reversed(range(len(network))):
        layer = network[i]
        errors = []
        if i != len(network)-1:
            for j in range(len(layer)):
                error = 0
                for neuron in network[i + 1]:
                    error += (neuron['weights'][j] * neuron['delta'])
                errors.append(error)
            for j in range(len(layer)):
                neuron = layer[j]
                neuron['delta'] = errors[j] * ReLUTransfer_func_derivative(neuron['output'])
        else:
            for j in range(len(layer)):
                neuron = layer[j]
                errors.append(neuron['output'] - expected)
            for j in range(len(layer)):
                neuron = layer[j]
                neuron['delta'] = errors[j] #* SigmoidTransfer_func_derivative(neuron['output'])
                
# update NN parameters
def update_params(network, rows, learning_rate):
    for i in range(len(network)):
        inputs = rows[:-1]
        if i != 0:
            inputs = [neuron['output'] for neuron in network[i - 1]]
        for neuron in network[i]:
            for j in range(len(inputs)):
                neuron['weights'][j] -= learning_rate * neuron['delta'] * inputs[j]
            neuron['bias'] -= learning_rate * neuron['delta']

# train NN
def train_network(network, train, l_rate, n_steps):
       for steps in range(n_steps):
            sum_error = 0
            for row in train:
                outputs = forward_propagate(network, row)
                expected = row[-1]
                if expected == 1:
                    sum_error -= log(outputs)
                elif expected == 0:
                    sum_error -= log(1 - outputs)
                back_propagate(network, expected)
                update_params(network, row, l_rate)
            if (steps % 1000 == 0):
                print('No. of Steps = %d, Error = %.3f, Predicted = %.4f, Expected = %d' % (steps, sum_error, outputs, expected)) 

# used NN for prediction          
def predict(network, row):
    outputs = forward_propagate(network, row)
    if outputs > 0.5:
        return 1
    else:
        return 0



