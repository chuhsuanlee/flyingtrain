# -*- coding: utf-8 -*-
import flyingtrain

test_file = 'test.txt'


def test():
    flyingtrain.extract_data(test_file)


if __name__ == "__main__":
    import timeit
    t = timeit.Timer("test()", setup="from __main__ import test")
    print t.repeat(repeat=3, number=1000)
