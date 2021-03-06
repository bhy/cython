cdef extern from "<queue>" namespace "std":
    cdef cppclass queue[T]:
        queue()
        queue(queue&)
        #queue(Container&)
        T& back()
        bint empty()
        T& front()
        void pop()
        void push(T&)
        size_t size()
    cdef cppclass priority_queue[T]:
        priority_queue()
        priority_queue(priority_queue&)
        #priority_queue(Container&)
        bint empty()
        void pop()
        void push(T&)
        size_t size()
        T& top()
