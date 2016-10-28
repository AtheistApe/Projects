# -*- coding: utf-8 -*-
"""
Spyder Editor

This is a temporary script file.
"""

import logging
root = logging.getLogger()

while len(root.handlers):
    root.removeHandler(root.handlers[0])
    
logging.basicConfig(level=logging.DEBUG, format='%(asctime)s - %(levelname)s - %(message)s')


# Uncomment the next line to disable logging messages
# logging.disable(logging.CRITICAL)

logging.debug('Start of program')

def factorial(n):
    logging.debug('Start of factorial(%s)' % (n))
    total = 1
    for i in range(n+1):
        total *= i 
        logging.debug('i is %s, total is %s' % (i, total))
    logging.debug('Return value is %s', (total))
    return total

logging.debug('End of program')

print(factorial(5))
