import matplotlib.pyplot as plt
import tensorflow as tf
from tensorflow import keras
from keras import backend as K
import os
import fnmatch
import numpy as np


def show_history(history, metrics=['accuracy']):
    """
    Visualize history
    """

    # Plot history: Loss
    plt.figure()
    plt.plot(history.history['loss'])
    plt.plot(history.history['val_loss'])
    plt.title('Loss history')
    plt.ylabel('Loss value')
    plt.xlabel('No. epoch')
    plt.legend(['train', 'validation'], loc='upper left')
    plt.show()

    for metric in metrics:
        # Plot history:
        plt.figure()
        plt.plot(history.history[metric])
        plt.plot(history.history['val_' + metric])
        plt.title(metric + ' history')
        plt.ylabel(metric + ' value (%)')
        plt.xlabel('No. epoch')
        plt.legend(['train', 'validation'], loc='upper left')
        plt.show()


def r2_keras(y_true, y_pred):
    """
    Custom R2-score metrics for keras backend
    :param y_true: valor real
    :type y_true: Tensor
    :param y_pred: valor predicho
    :type y_pred: Tensor
    :return: r2 score
    :rtype: tensor
    """
    ss_res = K.sum(K.square(y_true - y_pred))
    ss_tot = K.sum(K.square(y_true - K.mean(y_true)))
    return 1 - ss_res / (ss_tot + K.epsilon())


def search_names(path, extension='*.npy'):
    """
    Buscamos los nombres de todas los archivos con la extensión dada en el path
    :param path: Donde se quiere buscar
    :type path: str
    :param extension: Extensión de los archivos que se quiere buscar
    :type extension: np.ndarray
    :return: Lista con todos los nombre
    :rtype: list[str]
    """
    matches = []
    for root, dir_names, filenames in os.walk(path):
        for filename in fnmatch.filter(filenames, extension):
            matches.append(os.path.join(root, filename))
    return matches
