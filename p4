def FIFO_queue():
    queue = []
    while True:
        inst, val = yield
        if inst == 'insert':
            if len(queue) < 10:
                queue.append(val)
                yield True
            else:
                queue.pop(0)
                queue.append(val)
                yield False
        elif inst == 'pop':
            if queue:
                yield queue.pop(0)
            else:
                yield None

gen = FIFO_queue()
next(gen)
print(gen.send(("insert", 10))) 
next(gen)
print(gen.send(("insert", 5))) 
next(gen)
print(gen.send(("insert", 20))) 
next(gen)
print(gen.send(("pop", None))) 
next(gen)
print(gen.send(("pop", None))) 
next(gen)
print(gen.send(("pop", None))) 
next(gen)
print(gen.send(("pop", None))) 
next(gen)


