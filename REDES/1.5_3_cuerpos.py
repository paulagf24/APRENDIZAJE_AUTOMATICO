from time import time
import tensorflow as tf
from tensorflow import keras
import numpy as np
from keras import Input
import matplotlib.pyplot as plt

# slow on gpu
tf.config.set_visible_devices([], 'GPU')


def calculate_sum_distances(x1, y1, x2, y2, x3, y3):
    return np.sqrt((x1 - x2) ** 2 + (y1 - y2) ** 2) + np.sqrt((x1 - x3) ** 2 + (y1 - y3) ** 2) + np.sqrt(
        (x2 - x3) ** 2 + (y2 - y3) ** 2)


def calc_vetor(x1, y1, x2, y2, m1, m2):
    v1 = x2 - x1
    v2 = y2 - y1
    f = (m1 * m2) / (v1 ** 2 + v2 ** 2)
    v1 = v1 * f
    v2 = v2 * f
    return v1, v2


def one_step_layer(m1, m2, m3, vx1, vx2, vx3, vy1, vy2, vy3, x1, x2, x3, y1, y2, y3):
    vx1_2, vy1_2 = calc_vetor(x1, y1, x2, y2, m1, m2)
    vx1_3, vy1_3 = calc_vetor(x1, y1, x3, y3, m1, m3)
    vx2_1, vy2_1 = -1 * vx1_2, -1 * vy1_2
    vx2_3, vy2_3 = calc_vetor(x2, y2, x3, y3, m2, m3)
    vx3_1, vy3_1 = -1 * vx1_3, -1 * vy1_3
    vx3_2, vy3_2 = -1 * vx2_3, -1 * vy2_3
    vx1 = vx1 + (vx1_2 + vx1_3) * c_t / m1
    vy1 = vy1 + (vy1_2 + vy1_3) * c_t / m1
    vx2 = vx2 + (vx2_1 + vx2_3) * c_t / m2
    vy2 = vy2 + (vy2_1 + vy2_3) * c_t / m2
    vx3 = vx3 + (vx3_1 + vx3_2) * c_t / m3
    vy3 = vy3 + (vy3_1 + vy3_2) * c_t / m3
    x1 = x1 + vx1 * c_t
    y1 = y1 + vy1 * c_t
    x2 = x2 + vx2 * c_t
    y2 = y2 + vy2 * c_t
    x3 = x3 + vx3 * c_t
    y3 = y3 + vy3 * c_t
    return vx1, vx2, vx3, vy1, vy2, vy3, x1, x2, x3, y1, y2, y3


# podemos usar la librería tensorflow para hacer operaciones elementales
def generate_neural_network(time_steps):
    """
    :param time_steps: Número de iteraciones en cada paso
    """
    # input: (x1, y1, x2, y2, x3, y3, v1, v2, v3, m1, m2, m3)
    # output: (v1, v2, v3)
    input_model = Input(shape=(None, 15))
    (x1, y1, x2, y2, x3, y3, vx1, vy1, vx2, vy2, vx3, vy3, m1, m2, m3) = [input_model[:, k] for k in range(15)]

    for _ in range(time_steps):
        vx1, vx2, vx3, vy1, vy2, vy3, x1, x2, x3, y1, y2, y3 = (
            one_step_layer(m1, m2, m3, vx1, vx2, vx3, vy1, vy2, vy3, x1, x2, x3, y1, y2, y3))

    output_model = tf.stack([x1, y1, x2, y2, x3, y3, vx1, vy1, vx2, vy2, vx3, vy3, m1, m2, m3], axis=1)
    model = tf.keras.Model(inputs=input_model, outputs=output_model)
    return model


if __name__ == '__main__':
    # Incremento en el tiempo
    c_t = 0.0001

    # generate_next_steps()
    model = generate_neural_network(10)
    print(model.summary())
    example = tf.constant(np.array([1, 0, -1, 0, 0, 1, 1, 0, 2, -0.5, 1, 0.5, 2, 3, 3]).reshape(1, 15))


    for _ in range(20000):
        t1 = time()
        for j in range(10):
            example = model.predict_on_batch(example)
        print(time() - t1)
        print(example.shape)
        example_plot = example[0]  # .numpy()
        # ploteamos el resultado
        plt.plot(example_plot[0], example_plot[1], 'ro')
        plt.plot(example_plot[2], example_plot[3], 'bo')
        plt.plot(example_plot[4], example_plot[5], 'go')
        plt.pause(0.01)
        # plt.clf()  # Clear the figure
    plt.show()
    plt.close()
