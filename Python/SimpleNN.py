import tensorflow as tf 
import numpy as np 
import pandas as pd 
import matplotlib.pyplot as plt
import time

df1 = pd.read_csv("mnist_train.csv")
df2 = pd.read_csv("mnist_test.csv")
X_train = df1.iloc[:,1:]
y_train = df1.iloc[:,0]
X_test = df2.iloc[:,1:]
y_test = df2.iloc[:,0]

X_train = np.array(X_train)
X_test = np.array(X_test)
y_train = np.array(y_train)
y_test = np.array(y_test)
y_train = tf.keras.utils.to_categorical(y_train, 10)
y_test = tf.keras.utils.to_categorical(y_test, 10)

model = tf.keras.Sequential()
model.add(tf.keras.layers.InputLayer(input_shape=(784,)))
model.add(tf.keras.layers.Dense(128, activation='relu'))
model.add(tf.keras.layers.Dense(10, activation='softmax'))

model.compile(loss='categorical_crossentropy', metrics=['accuracy'], optimizer=tf.keras.optimizers.SGD(learning_rate=1e-5))
start = time.time()
nn_model = model.fit(X_train, y_train, epochs = 30, validation_data=(X_test, y_test))
end = time.time()

print()
print('Duration in minutes: %.2f' % ((end - start)/60))
print()

plt.figure(1)
plt.plot(nn_model.history['accuracy'])
plt.plot(nn_model.history['val_accuracy'])
plt.title('Model Accuracy')
plt.ylabel('Accuracy')
plt.xlabel('Epoch')
plt.legend(['train', 'test'], loc='upper left', bbox_to_anchor=(1.04, 1))
plt.grid(which='major', color='#DDDDDD', linewidth=0.8)
plt.grid(which='minor', color='#EEEEEE', linestyle=':', linewidth=0.5)
plt.minorticks_on()
plt.figure(2)
plt.plot(nn_model.history['loss'])
plt.plot(nn_model.history['val_loss'])
plt.title('Model Loss')
plt.ylabel('Loss')
plt.xlabel('Epoch')
plt.legend(['train', 'test'], loc='upper left', bbox_to_anchor=(1.04, 1))
plt.grid(which='major', color='#DDDDDD', linewidth=0.8)
plt.grid(which='minor', color='#EEEEEE', linestyle=':', linewidth=0.5)
plt.minorticks_on()
plt.show()